resource "azurerm_template_deployment" "storage_account_arm" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  template_body       = file("storage-containers.json",)
  parameters = {
    storage_account_name    = var.storage_account_name
    storage_account_type    = var.storage_account_type
    location                = var.location
    StorageAccountKind      = "StorageV2"
  }
}
