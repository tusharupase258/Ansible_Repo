module "azurerm_RG_module" {
  source = "../02.RG"
  tusharRGvars = var.tusharRGvarsM
}

module "azurerm_VNET_module" {
  source = "../03.Vnet"
  tusharvnetsvar = var.tusharvnetsvarsM
  depends_on = [ module.azurerm_RG_module ]
}

module "azurerm_subnet_module" {
  source = "../04.Subnet"
  tusharsubnetsvar = var.tusharsubnetsvarM
  depends_on = [ module.azurerm_VNET_module ]
}

module "azurerm_public_ip_module" {
  source = "../05.Public_Ip"
  tusharipsvar = var.tusharipsvarM
  depends_on = [ module.azurerm_RG_module ]
}

module "azurerm_nic_module" {
  source = "../06.NIC"
  tusharnicsvars = var.tusharnicvarsM
  tusharpublicipdata = var.tusharipsvarM
  tusharsubnetsvar = var.tusharsubnetsvarM
  depends_on = [ var.tusharipsvarM ]
}

module "azurerm_keyvault_module" {
  source = "../07.KeyVault"
  tusharkeyvaultsvars = var.tusharkeyvaultsvarsM
  depends_on = [ module.azurerm_RG_module ]
}

module "azurerm_password_module" {
  source = "../08.username&passwd for vm"
  tusharkeyvaultsvars = var.tusharkeyvaultsvarsM
  tusharpasswdsvars = var.tusharpasswdsvarsM
}

module "azurerm_vm_module" {
  source = "../09.VM"
  tusharlinuxvmsvar = var.tusharlinuxvmsvarM
  tusharkeyvaultsvars = var.tusharkeyvaultsvarsM
  tusharnicsvars = var.tusharnicvarsM
  tusharpasswdsvars = var.tusharpasswdsvarsM
}

module "azurerm_nsg_module" {
  source = "../10.NSG"
  tusharnicsvars = var.tusharnicvarsM
  tusharnsgvars = var.tusharnsgvarsM
}