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
    description = "The vSphere Datacenter into which resources will be created."
}

variable "vsphere_datastore" {
    type = string
    description = "The vSphere Datastore into which resources will be created."
}

variable datastore_cluster_name {
  type    = string
  default = ""
  description = "The vSphere Datastore Cluster into which resources will be created."
}

variable "vsphere_compute_cluster" {
    type = string
    description = "The vSphere Cluster into which resources will be created."
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

variable "vm_hostname" {
  type        = string
  default     = "ubuntu"
  description = "The virtual machine name."
}
