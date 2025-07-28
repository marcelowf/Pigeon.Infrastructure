variable "function_app_name" {
  type        = string
  description = "Name of the Azure Function App"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "app_service_plan_id" {
  type        = string
  description = "ID of the App Service Plan"
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name"
}

variable "storage_account_key" {
  type        = string
  description = "Storage account key"
}

variable "app_settings" {
  type        = map(string)
  default     = {}
  description = "App settings for the Function App"
}

variable "tags" {
  type    = map(string)
  default = {}
}
