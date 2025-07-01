tusharRGvarsM = {
  tusharansibleRG = {
    name = "tusharansibleRG"
    location = "France Central"
  }
}

tusharvnetsvarsM = {
  tusharansiblevnet1 = {
    name = "tusharansiblevnet1"
    location = "France central"
    resource_group_name = "tusharansibleRG"
    address_space = ["10.1.0.0/16"]
  }
#    tusharansiblevnet2 = {
#     name = "tusharansiblevnet2"
#     location = "France central"
#     resource_group_name = "tusharansibleRG"
#     address_space = ["10.2.0.0/16"]
#   }
}

tusharsubnetsvarM = {
  tusharansiblesubnet1 = {
    name = "tusharansiblesubnet1"
    resource_group_name = "tusharansibleRG"
    virtual_network_name = "tusharansiblevnet1"
    address_prefixes = ["10.1.1.0/24"]
  }
  tusharansiblesubnet2 = {
    name = "tusharansiblesubnet2"
    resource_group_name = "tusharansibleRG"
    virtual_network_name = "tusharansiblevnet1"
    address_prefixes = ["10.1.2.0/24"]
  }
}

tusharipsvarM = {
  tusharansiblepublicip1 ={
    name = "tusharansiblepublicip1"
    resource_group_name = "tusharansibleRG"
    location = "France Central"
    allocation_method = "Static"
  }
  tusharansiblepublicip2 ={
    name = "tusharansiblepublicip2"
    resource_group_name = "tusharansibleRG"
    location = "France Central"
    allocation_method = "Static"
  }
}

tusharnicvarsM = {
  tusharansiblenic1 = {
    name = "tusharansiblenic1"
    location = "France Central"
    resource_group_name = "tusharansibleRG"
    ip_configuration_name = "tusharipconfig1"
    subnet_name = "tusharansiblesubnet1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = ""
    public_ip = "tusharansiblepublicip1"
  }
  tusharansiblenic2 = {
    name = "tusharansiblenic2"
    location = "France Central"
    resource_group_name = "tusharansibleRG"
    ip_configuration_name = "tusharipconfig2"
    subnet_name = "tusharansiblesubnet2"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = ""
    public_ip = "tusharansiblepublicip2"
  }
}

tusharkeyvaultsvarsM = {
  tusharkeyvault81 = {
    name = "tusharkeyvault81"
    resource_group_name = "tusharansibleRG"
    location = "France Central"
    sku_name = "standard"
    tenant_id = ""
    object_id = ""
  }
}

tusharpasswdsvarsM = {
  tusharansiblevm1 = {
    name = "tusharansiblevm1"
    length = 16
    special = true
    override_special = false
    value = ""
    key_vault_id = ""
    key_vault = "tusharkeyvault81"
  }

  tusharansiblevm2 = {
    name = "tusharansiblevm2"
    length = 16
    special = true
    override_special = false
    value = ""
    key_vault_id = ""
    key_vault = "tusharkeyvault81"
  }
}

tusharlinuxvmsvarM = {
  tusharansiblevm1 = {
    name = "tusharansiblevm1"
    location = "France Central"
    resource_group_name = "tusharansibleRG"
    admin_username = ""
    admin_password = ""
    disable_password_authentication = false
    size = "Standard_F2"
    network_interface_ids = ""
    nic = "tusharansiblenic1"
  }

  tusharansiblevm2 = {
    name = "tusharansiblevm2"
    location = "France Central"
    resource_group_name = "tusharansibleRG"
    admin_username = ""
    admin_password = ""
    disable_password_authentication = false
    size = "Standard_F2"
    network_interface_ids = ""
    nic = "tusharansiblenic2"
  }
}

tusharnsgvarsM = {
  tusharansiblevm1 = {
    name                = "NSG1_RDP_SSH"
    resource_group_name = "tusharansibleRG"
    location            = "France Central"
    nic                 = "tusharansiblenic1"
    security_rules = [
      {
        name                       = "Allow-SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-RDP"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
  tusharansiblevm2 = {
    name                = "NSG2_RDP_SSH"
    resource_group_name = "tusharansibleRG"
    location            = "France Central"
    nic                 = "tusharansiblenic2"
    security_rules = [
      {
        name                       = "Allow-SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-RDP"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}
