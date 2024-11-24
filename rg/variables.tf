variable "location" {
  description = "Azure location where the resources are deployed to"
  type        = string
  default     = "westeurope"
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "tags" {
  description = "This Object is used to store information about the running deployment. Resources will be tagged with it."
  type        = map(string)
}

