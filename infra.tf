provider "azurerm" {
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.azure_resource_group_name}"
  location = "${var.azure_location}"
}

resource "azurerm_storage_account" "sa" {
  name                      = "storageaccount${lower(replace(substr(uuid(), 0, 10), "-", ""))}"
  resource_group_name       = "${azurerm_resource_group.rg.name}"
  location                  = "${var.azure_location}"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  lifecycle {
      ignore_changes        = ["name"]
  }
}
###################### VNET DEV ###################
resource "azurerm_virtual_network" "vnet-dev" {
  name          = "${var.vnet-dev-name}"
  address_space = ["${var.vnet-dev-address-space}"]
  location      = "${var.azure_location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
}

resource "azurerm_subnet" "subnet-dev-web" {
  name                 = "subnet-dev-web"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet-dev.name}"
  address_prefix       = "${var.subnet-dev-ext}"
}

resource "azurerm_subnet" "subnet-dev-app" {
  name                 = "subnet-dev-app"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet-dev.name}"
  address_prefix       = "${var.subnet-dev-int}"
}

resource "azurerm_subnet" "subnet-dev-db" {
  name                 = "subnet-dev-db"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet-dev.name}"
  address_prefix       = "${var.subnet-dev-data}"
}

###################### VNET STG ###################
resource "azurerm_virtual_network" "vnet-stg" {
  name          = "${var.vnet-stg-name}"
  address_space = ["${var.vnet-stg-address-space}"]
  location      = "${var.azure_location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
}

resource "azurerm_subnet" "subnet-stg-web" {
  name                 = "subnet-stg-web"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet-stg.name}"
  address_prefix       = "${var.subnet-stg-ext}"
}

resource "azurerm_subnet" "subnet-stg-app" {
  name                 = "subnet-stg-app"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet-stg.name}"
  address_prefix       = "${var.subnet-stg-int}"
}

resource "azurerm_subnet" "subnet-stg-db" {
  name                 = "subnet-stg-db"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet-stg.name}"
  address_prefix       = "${var.subnet-stg-data}"
}

###################### VNET PRD ###################
resource "azurerm_virtual_network" "vnet-prd" {
  name          = "${var.vnet-prd-name}"
  address_space = ["${var.vnet-prd-address-space}"]
  location      = "${var.azure_location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
}

resource "azurerm_subnet" "subnet-prd-web" {
  name                 = "subnet-prd-web"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet-prd.name}"
  address_prefix       = "${var.subnet-prd-ext}"
}

resource "azurerm_subnet" "subnet-prd-app" {
  name                 = "subnet-prd-app"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet-prd.name}"
  address_prefix       = "${var.subnet-prd-int}"
}

resource "azurerm_subnet" "subnet-prd-db" {
  name                 = "subnet-prd-db"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet-prd.name}"
  address_prefix       = "${var.subnet-prd-data}"
}
