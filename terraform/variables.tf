variable "resource_group_location" {
  type        = string
  default     = "southcentralus"
  description = "Location of the resource group."
}

variable "prefix" {
  type        = string
  default     = "sistema-mgm"
  description = "Prefix of the resource group name that's unique in your Azure subscription."
}

variable "db_username" {
  type        = string
  description = "The username of the database administrator."
  sensitive   = true
}

variable "db_password" {
  type        = string
  description = "The password of the database administrator."
  sensitive   = true
}

variable "jwt_recovery" {
  type        = string
  description = "JWT Recovery Key"
  sensitive   = true
}