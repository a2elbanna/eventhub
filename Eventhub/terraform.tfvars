#values for module eventhub
azure_subscription_id            = "AZURE SUBSCRIPTION ID"
eventhub_resource_group_name     = "resourceGroupForEventhub"
eventhub_resource_group_location = "West US"

eventhub_namespace_name          = "acceptanceTestEventHubNamespace"
eventhub_namespace_sku           = "Standard"
eventhub_namespace_capacity      = 1
eventhub_namespace_environment   = "Production"

eventhub_name                    = "acceptanceTestEventHub"
eventhub_partition_count         = 2
eventhub_message_retention       = 1

storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"
storage_account_name             = "eventhubSA"
monitor_diagnostic_setting_name  = "eventhubDS"
#======================================================================================================