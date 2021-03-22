variable "vsphere_user" {
    type = string
    sensitive = true
}

variable "vsphere_password" {
    type = string
    sensitive = true
}

variable "vsphere_server" {
    type = string
    sensitive = true
}

variable "vsphere_datacenter" {  
    type = string
}

variable "vsphere_datastore" {
    type = string
}

variable "vsphere_compute_cluster" {
    type = string
}

variable "vsphere_resource_pool" {
    type = string
}
variable "vsphere_network" {
    type = string
}

variable "vsphere_folder" {
  type = string
}

variable "vm_template_name" {
    type = string
    description = "Name of VM template"
}
