variable "namespace_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "queue_names" {
  description = "List of queue names to create"
  type        = list(string)
  default     = []
}
