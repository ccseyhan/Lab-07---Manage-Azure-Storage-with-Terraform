resource "azurerm_resource_group" "rg0" {
  name     = var.rg0_name
  location = var.location
}

resource "azurerm_resource_group" "rg1" {
  name     = var.rg1_name
  location = var.location
}