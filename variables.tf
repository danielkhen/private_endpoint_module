variable "name" {
  description = "(Required) The name of the private endpoint."
  type        = string
}

variable "location" {
  description = "(Required) The location of the private endpoint and private dns zone."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group."
  type        = string
}

variable "private_dns_enabled" {
  description = "(Optional) Should a private dns zone be included."
  type        = bool
  default     = false
}

variable "private_dns_zone_id" {
  description = "(Optional) The id of the private dns zone to link with the private endpoint."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "(Required) The subnet id for the private endpoint."
  type        = string
}

variable "resource_id" {
  description = "(Required) The resource id to associate with the private endpoint."
  type        = string
}

variable "subresource_name" {
  description = "(Required) The subresource to associate with the private endpoint."
  type        = string
}

variable "log_analytics_id" {
  description = "(Required) The id of the log analytics workspace."
  type        = string
}