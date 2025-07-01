resource "azurerm_network_interface" "tusharnics" {
  for_each = var.tusharnicsvars
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name = each.value.ip_configuration_name
    subnet_id = data.azurerm_subnet.tusharsubnetsdata[each.value.subnet_name].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id = data.azurerm_public_ip.tusharpublicipdata[each.value.public_ip].id
  }
}