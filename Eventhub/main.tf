module "eventhub" {
    source = "./module-eventhub"
    #passing value of variables needed to the module
    azure_subscription_id            = var.azure_subscription_id
    eventhub_resource_group_name     = var.eventhub_resource_group_name
    eventhub_resource_group_location = var.eventhub_resource_group_location

    eventhub_namespace_name          = var.eventhub_namespace_name
    eventhub_namespace_sku           = var.eventhub_namespace_sku
    eventhub_namespace_capacity      = var.eventhub_namespace_capacity
    eventhub_namespace_environment   = var.eventhub_namespace_environment

    eventhub_name                    = var.eventhub_name
    eventhub_partition_count         = var.eventhub_partition_count
    eventhub_message_retention       = var.eventhub_message_retention

    monitor_diagnostic_setting_name  = var.monitor_diagnostic_setting_name
    storage_account_name             = var.storage_account_name
    storage_account_tier             = var.storage_account_tier
    storage_account_replication_type = var.storage_account_replication_type
}