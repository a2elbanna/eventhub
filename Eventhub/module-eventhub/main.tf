terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.9.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

#======================================================================================================
#Create a resource group
resource "azurerm_resource_group" "eventhub_RG" {
  name     = var.eventhub_resource_group_name
  location = var.eventhub_resource_group_location
  tags {
    environment = var.eventhub_namespace_environment
  }
}

#======================================================================================================
#creating eventhub namespace
resource "azurerm_eventhub_namespace" "eventhub_namespace" {
  name                = var.eventhub_namespace_name
  location            = azurerm_resource_group.eventhub_RG.location
  resource_group_name = azurerm_resource_group.eventhub_RG.name
  sku                 = var.eventhub_namespace_sku
  capacity            = var.eventhub_namespace_capacity

  tags {
    environment = var.eventhub_namespace_environment
  }
}

#======================================================================================================
#creating eventhub
resource "azurerm_eventhub" "eventhub" {
  name                = var.eventhub_name
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  resource_group_name = azurerm_resource_group.eventhub_RG.name
  partition_count     = var.eventhub_partition_count
  message_retention   = var.eventhub_message_retention
}

#======================================================================================================
#creating a diagnostic storage
resource "azurerm_storage_account" "diagnostic_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.eventhub_RG.name
  location                 = azurerm_resource_group.eventhub_RG.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  tags = {
    environment = var.eventhub_namespace_environment
  }
}

data "azurerm_monitor_diagnostic_categories" "diagnostic_categories" {
  resource_id = azurerm_eventhub_namespace.eventhub_namespace.id
}

#creating diagnostic settings for the eventhub
resource "azurerm_monitor_diagnostic_setting" "eventhub" {
  name               = var.monitor_diagnostic_setting_name
  target_resource_id = azurerm_eventhub_namespace.eventhub_namespace.id
  storage_account_id = azurerm_storage_account.diagnostic_storage.id
  dynamic "log" {
      for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.logs
      content {
        category = log.value
        enabled  = true

        retention_policy {
        enabled = false
        }
      }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
}