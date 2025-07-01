resource "azurerm_linux_virtual_machine" "tusharlinuxvms" {
  for_each = var.tusharlinuxvmsvar
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  admin_username = each.value.name
  admin_password = data.azurerm_key_vault_secret.tusharkvsecretdata[each.key].value
  disable_password_authentication = false
  size = each.value.size
  network_interface_ids = [data.azurerm_network_interface.tusharnicdata[each.value.nic].id]
  os_disk {
    storage_account_type = "Standard_LRS"
    caching = "ReadWrite"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
