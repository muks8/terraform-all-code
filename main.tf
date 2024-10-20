resource "azurerm_resource_group" "rg003" {
  name     = "myrg01"
  location = "central india"
}

resource "azurerm_storage_account" "storage2" {
  depends_on = [ azurerm_resource_group.rg003 ]
  count                    = var.enable_storage ? 1 : 0
  name                     = "mukstorage1"
  resource_group_name      = "myrg01"
  location                 = "central india"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
output "resourcegroup-id" {
  value = azurerm_resource_group.rg003.id
}