data "azurerm_key_vault" "tusharkvdata" {
  for_each = var.tusharkeyvaultsvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
}