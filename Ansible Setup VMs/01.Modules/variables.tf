variable "tusharRGvarsM" {
  type = map(object({
    name = string
    location = string
  }))
}

variable "tusharvnetsvarsM" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    address_space = list(string)
  }))
}

variable "tusharsubnetsvarM" {
  type = map(object({
    name = string
    resource_group_name = string
    virtual_network_name = string
    address_prefixes = list(string)
  }))
}

variable "tusharipsvarM" {
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    allocation_method = string
  }))
}

variable "tusharnicvarsM" {
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    ip_configuration_name = string
    subnet_name = string
    private_ip_address_allocation = string
    public_ip_address_id = string
    public_ip = string
  }))
}

variable "tusharkeyvaultsvarsM" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    sku_name = string
    tenant_id = string
    object_id = string
  }))
}

variable "tusharpasswdsvarsM" {
  type = map(object({
    name = string
    value = string
    key_vault_id = string
    key_vault = string
    length = number
    special = bool
    override_special = bool
  }))
}

variable "tusharlinuxvmsvarM" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    admin_username = string
    admin_password = string
    disable_password_authentication = bool
    size = string
    network_interface_ids = string
    nic = string
  }))
}

variable "tusharnsgvarsM" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    nic                 = string
    security_rules      = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}
