variable "vsphere_user" {
    type = string
}

variable "vsphere_password" {
    type = string
}

variable "vsphere_server" {
    type = string
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

variable "vsphere_network" {
    type = string
}

variable "vm_template_name" {
    type = string
    description = "Name of VM template"
}