resource "random_password" "tusharpasswds" {
  for_each = var.tusharpasswdsvars
  length = each.value.length
  special = each.value.special
  override_special = each.value.override_special
}

resource "azurerm_key_vault_secret" "tusharkvsecrets" {
  for_each = var.tusharpasswdsvars
  name = "${each.value.name}-passwd"
  value = random_password.tusharpasswds[each.key].result
  key_vault_id = data.azurerm_key_vault.tusharkvdata[each.value.key_vault].id
}