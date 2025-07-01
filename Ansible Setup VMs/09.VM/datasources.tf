data "azurerm_key_vault" "tusharkvdata" {
  for_each = var.tusharkeyvaultsvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "tusharkvsecretdata" {
  for_each = var.tusharpasswdsvars
  name = "${each.value.name}-passwd"
  key_vault_id = data.azurerm_key_vault.tusharkvdata[each.value.key_vault].id
}

data "azurerm_network_interface" "tusharnicdata" {
  for_each = var.tusharnicsvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
}