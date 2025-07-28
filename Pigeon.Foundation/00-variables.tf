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
