# Random String Generator X

resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

# Create Resource Group
resource "azurerm_resource_group" "rg_web" {
  name     = local.rg_name
  location = var.location
}


# Create Storage Account
resource "azurerm_storage_account" "sa_web" {
  name                     = "${lower(local.sa_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg_web.name
  location                 = azurerm_resource_group.rg_web.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = {
    environment = "Test"
  }
}

# Static website ressurs tilhørende storage accounten

resource "azurerm_storage_account_static_website" "testings" {
  storage_account_id = azurerm_storage_account.sa_web.id
  # error_404_document = "custom_not_found.html"
  index_document = var.index_document
}

# Add a index.html file to the storage account
resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa_web.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "${var.source_content}<h2>${local.web_suffix}</h2>"

  depends_on = [azurerm_storage_account_static_website.testings]
}

