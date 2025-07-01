resource "azurerm_key_vault" "tusharkeyvaults" {
  for_each = var.tusharkeyvaultsvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  sku_name = each.value.sku_name
  tenant_id = data.azurerm_client_config.tushartenantdata.tenant_id

access_policy {
    tenant_id = data.azurerm_client_config.tushartenantdata.tenant_id
    object_id = data.azurerm_client_config.tushartenantdata.object_id

    key_permissions = [
        "Get",
    ]

    secret_permissions = [
        "Get", "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
    ]

    storage_permissions = [
        "Get",
     ]
}
}