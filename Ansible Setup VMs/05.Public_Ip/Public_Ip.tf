resource "azurerm_public_ip" "tusharIps" {
  for_each = var.tusharipsvar
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method = each.value.allocation_method
}