provider "azurerm" {
  version         = "=2.5.0"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {}

}

provider "azuredevops" {
  version               = ">=0.0.1"
  org_service_url       = var.org_service_url
  personal_access_token = var.personal_access_token
}

resource "azurerm_resource_group" "rg" {
  count = 2

  name     = "${var.rgname}${count.index}"
  location = var.location

  tags = var.tags

}
resource "azurerm_storage_account" "stg" {
  name                     = var.stg_acc_name
  resource_group_name      = azurerm_resource_group.rg[0].name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "default-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg[0].name
}

resource "azurerm_subnet" "snet" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = azurerm_resource_group.rg[0].name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = each.value
}

resource "azuredevops_project" "adoproject" {
  project_name = var.ado_project_name
}
