resource "azurerm_storage_account" "standard-storage" {
  name                      = "${var.storage_account_name}"
  location                  = "${var.location}"
  resource_group_name       = "${var.resource_group_name}"
  account_tier              = "Standard"
  account_replication_type  = "${var.standard_replication_type}"
  enable_https_traffic_only = true
  blob_properties {
    delete_retention_policy {
      days = 30
    }
    container_delete_retention_policy {
      days = 30
    }
  }  
}

resource "azurerm_template_deployment" "storage_account_arm" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  deployment_mode           = "Incremental"
  depends_on = [
    "azurerm_storage_account.standard-storage",
  ]
  template_body             = file("storage-containers.json")
  parameters = {
    storage_account_name          = var.storage_account_name
    location                      = var.location
  }
}
