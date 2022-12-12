resource "azurerm_virtual_network" "vnet0" {
  name                = var.vnet0_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg0.name
  address_space       = ["10.70.0.0/22"]
}

resource "azurerm_subnet" "subnet0" {
  name                 = "subnet0"
  resource_group_name  = azurerm_resource_group.rg0.name
  virtual_network_name = azurerm_virtual_network.vnet0.name
  address_prefixes     = ["10.70.0.0/24"]
}