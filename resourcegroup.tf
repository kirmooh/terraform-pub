# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "devrg1" {
  # name     = "dev1-rg1-terraform1"
  name     = "${var.azure_env}-RG1"
  location = var.azure_loc

  tags = local.common_tags
}

/*# Resource-2: Random String 
resource "random_string" "randomnames" {
  length = 16
  upper = false 
  special = false
}

# Resource-3: Azure Storage Account 
resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.randomnames.id}"
  resource_group_name      = azurerm_resource_group.devrg1.name
  location                 = azurerm_resource_group.devrg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_encryption_source = "Microsoft.Storage"

  tags = {
    owner = "kiran"
    environment = "dev-terraform1"
  }
}*/