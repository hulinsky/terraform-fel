provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  allow_unverified_ssl = true
}

locals {
  #meta_data = templatefile("./metadata.yaml", { hostname = "" })
  meta_data = templatefile("${path.module}/cloud-init/metadata.tpl", { })
  user_data = templatefile("${path.module}/cloud-init/userdata.tpl", { })
}

resource "vsphere_virtual_machine" "vm" {
  name = "terraform-test"
  # resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 1024
  guest_id = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  cdrom {
    client_device = true
  }

  disk {
    label = "disk0"
    size  = 20
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  vapp {
    properties ={
      hostname = var.vm_hostname
      instance-id = var.vm_hostname
      password = "ubnt"
      #user-data = base64encode(file("${path.module}/cloudinit/kickstart.yaml"))
    }
  }

  extra_config = {
    "guestinfo.metadata"          = base64encode(var.meta_data)
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.userdata"          = base64encode(var.user_data)
    "guestinfo.userdata.encoding" = "base64"
  }

}
