variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "location" {
  type      = string
  sensitive = true
}

variable "tags" {
  type = map(string)
}

variable "env_suffix" {
  type = string
}

variable "sender_email" {
  type = string
}

variable "sender_key" {
  type      = string
  sensitive = true
}

variable "azure_devops_org" {
  type = string
}

variable "azure_devops_proj" {
  type = string
}

variable "azure_devops_pat" {
  type      = string
  sensitive = true
}
