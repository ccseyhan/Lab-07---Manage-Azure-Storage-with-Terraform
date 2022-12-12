resource "azurerm_storage_account" "storage1" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  public_network_access_enabled = true

}

resource "azurerm_storage_share" "file_share" {
  name                 = var.storage_share_name
  storage_account_name = azurerm_storage_account.storage1.name
  quota                = 50
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage1.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "tamopsblobs" {

  name                   = "Licence"
  storage_account_name   = azurerm_storage_account.storage1.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source                 = "./Lab-07---Manage-Azure-Storage-with-Terraform/licence.txt"
}