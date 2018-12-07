resource "azurerm_public_ip" "pip" {
  name                         = "pip-vm-${var.prefix}-${var.project-name}-0${count.index + 1}"
  location                     = "${var.azure_location}"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  public_ip_address_allocation = "static"
  sku                          = "Standard"
}

resource "azurerm_network_interface" "nic" {
  name                      = "nic1-vm-${var.prefix}-${var.project-name}-0${count.index + 1}"
  location                  = "${azurerm_resource_group.rg.location}"
  resource_group_name       = "${azurerm_resource_group.rg.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg-dev-db.id}"


  ip_configuration {
    name                          = "vm-${var.prefix}-${var.project-name}-ip-01"
    subnet_id                     = "${azurerm_subnet.subnet-dev-db.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.pip.id}"
  }
}

resource "azurerm_network_security_group" "nsg-dev-db" {
  name                = "nsg-dev-db"
  location            = "${var.azure_location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                              = "vm-${var.prefix}-${var.project-name}-0${count.index + 1}"
  location                          = "${var.azure_location}"
  resource_group_name               = "${azurerm_resource_group.rg.name}"
  network_interface_ids             = ["${element(azurerm_network_interface.nic.*.id, count.index)}"]
  vm_size                           = "${var.vm_size_default}"
  delete_os_disk_on_termination     = "true"
  delete_data_disks_on_termination  = "true"
  count                             = "${var.instance_count}"

  storage_image_reference {
    publisher = "${var.os_image_publisher}"
    offer     = "${var.os_image_offer}"
    sku       = "${var.os_image_sku}"
    version   = "${var.os_image_version}"
  }

  storage_os_disk {
    name              = "disk-os-vm-${var.prefix}-${var.project-name}-0${count.index + 1}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_data_disk {
    name              = "disk-data01-vm-${var.prefix}-${var.project-name}-0${count.index + 1}"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "Empty"
    disk_size_gb      = 60
    lun               = 0
  }

storage_data_disk {
    name              = "disk-data02-vm-${var.prefix}-${var.project-name}-0${count.index + 1}"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "Empty"
    disk_size_gb      = 100
    lun               = 1
  }

  storage_data_disk {
    name              = "disk-data03-vm-${var.prefix}-${var.project-name}-0${count.index + 1}"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "Empty"
    disk_size_gb      = 100
    lun               = 2
  }

  storage_data_disk {
    name              = "disk-data04-vm-${var.prefix}-${var.project-name}-0${count.index + 1}"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "Empty"
    disk_size_gb      = 100
    lun               = 3
  }

    storage_data_disk {
    name              = "disk-data05-vm-${var.prefix}-${var.project-name}-0${count.index + 1}"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "Empty"
    disk_size_gb      = 100
    lun               = 4
  }

    storage_data_disk {
    name              = "disk-data06-vm-${var.prefix}-${var.project-name}-0${count.index + 1}"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "Empty"
    disk_size_gb      = 100
    lun               = 5
  }

    storage_data_disk {
    name              = "disk-data07-vm-${var.prefix}-${var.project-name}-0${count.index + 1}"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "Empty"
    disk_size_gb      = 100
    lun               = 6
  }

  os_profile {
    computer_name  = "vm-${var.prefix}-${var.project-name}-0${count.index + 1}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }
}
