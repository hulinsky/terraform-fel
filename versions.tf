terraform {

  required_version = ">= 0.12.0"
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "1.25.0"
    }
  }

}
