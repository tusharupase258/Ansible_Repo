data "azurerm_subnet" "tusharsubnetsdata" {
  for_each = var.tusharsubnetsvar
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "tusharpublicipdata" {
  for_each = var.tusharpublicipdata
  name = each.value.name
  resource_group_name = each.value.resource_group_name
}