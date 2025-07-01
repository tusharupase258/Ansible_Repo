data "azurerm_network_interface" "tusharnicdata" {
  for_each             = var.tusharnicsvars
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
}