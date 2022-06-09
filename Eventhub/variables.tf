variable "azure_subscription_id" {
    type = string
    description = "azure subscription id"
}

variable "eventhub_resource_group_location" {
  type = string
}

variable "eventhub_resource_group_name" {
  type = string
}

variable "eventhub_namespace_name" {
  type = string
}

variable "eventhub_namespace_sku" {
  type = string
  default = "Standard"
}

variable "eventhub_namespace_capacity" {
  type = string
  default = 1
}

variable "eventhub_namespace_environment" {
  type = string
  default = "dev"
}

variable "eventhub_name" {
  type = string
}

variable "eventhub_partition_count" {
  type = string
  default = 1
}

variable "eventhub_message_retention" {
  type = string
  default = 1
}

variable "storage_account_name" {
  type = string
}

variable "storage_account_tier" {
  type = string
  default = "Standard"
}

variable "storage_account_replication_type" {
  type = string
  default = "LRS"
}

variable "monitor_diagnostic_setting_name" {
  type = string
}