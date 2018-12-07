variable "azure_resource_group_name" {
  description = "The name of your Azure Resource Group."
  default     = "YML-DEV"
}

variable "prefix" {
  default = "yml"
}

variable "instance_count" {
  default = "1"
}  

variable "project-name" {
  default = "sql-bo"
}
variable "azure_location" {
  description = "The region where the virtual network is created."
  default     = "eastus"
}

variable "vnet-dev-name" {
  description = "The name for your virtual network."
  default     = "DEV-VirtualNetwork"
}

variable "vnet-stg-name" {
  description = "The name for your virtual network."
  default     = "STG-VirtualNetwork"
}

variable "vnet-prd-name" {
  description = "The name for your virtual network."
  default     = "PRD-VirtualNetwork"
}

variable "vnet-dev-address-space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = ["172.96.0.0/16"]
}

variable "subnet-dev-ext" {
  description = "The address prefix to use for the subnet."
  default     = "172.96.0.0/24"
}

variable "subnet-dev-int" {
  description = "The address prefix to use for the subnet."
  default     = "172.96.1.0/24"
}

variable "subnet-dev-data" {
  description = "The address prefix to use for the subnet."
  default     = "172.96.2.0/24"
}

variable "vnet-stg-address-space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "172.96.0.0/16"
}

variable "subnet-stg-ext" {
  description = "The address prefix to use for the subnet."
  default     = "172.98.0.0/24"
}

variable "subnet-stg-int" {
  description = "The address prefix to use for the subnet."
  default     = "172.98.1.0/24"
}

variable "subnet-stg-data" {
  description = "The address prefix to use for the subnet."
  default     = "172.98.2.0/24"
}

variable "vnet-prd-address-space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "172.99.0.0/16"
}

variable "subnet-prd-ext" {
  description = "The address prefix to use for the subnet."
  default     = "172.99.0.0/24"
}

variable "subnet-prd-int" {
  description = "The address prefix to use for the subnet."
  default     = "172.99.1.0/24"
}

variable "subnet-prd-data" {
  description = "The address prefix to use for the subnet."
  default     = "172.99.2.0/24"
}

variable "storage_account_tier" {
  description = "Defines the storage tier. Valid options are Standard and Premium."
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Defines the replication type to use for this storage account. Valid options include LRS, GRS etc."
  default     = "LRS"
}

variable "vm_size_default" {
  description = "Standard F8s v2 - 8vCPU - 16GiB RAM"
  default     = "Standard_F8s_v2"
}

variable "os_image_publisher" {
  description = "Name of the publisher of the image (az vm image list)"
  default     = "MicrosoftWindowsServer"
}

variable "os_image_offer" {
  description = "Name of the offer (az vm image list)"
  default     = "WindowsServer"
}

variable "os_image_sku" {
  description = "Image SKU to apply (az vm image list)"
  default     = "2016-Datacenter"
}

variable "os_image_version" {
  description = "Version of the image to apply (az vm image list)"
  default     = "latest"
}

variable "admin_username" {
  description = "Administrator user name"
  default     = "cloud-user"
}

variable "admin_password" {
  description = "Administrator password"
  default     = "adminpassword"
}
