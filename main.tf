resource "azurerm_template_deployment" "storage_account_arm" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  template_body       = file("storage-containers.json",)
  parameters = {
    storage_account_name    = var.storage_account_name
    standard_replication_type    = var.standard_replication_type
    tls_version    = var.tls_version
    location                = var.location
    StorageAccountKind      = "StorageV2"
  }
}
