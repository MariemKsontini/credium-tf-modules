variable "rg_name" {
  description = "Name of the resource group in which the ACR should be created"
  type        = string
}

variable "acr_name" {
  description = "Name of the container registry"
  type        = string
}

variable "tags" {
  description = "This Object is used to store information about the running deployment. Resources will be tagged with it"
  type        = map(string)
}

variable "acr_token_name" {
  description = "Name of the acr token resource"
  type        = string
  default     = "aks-pull-token"
}

variable "location" {
  description = "Azure location where the resources are deployed in"
  type        = string
  default     = "westeurope"
}

variable "ip_rules" {
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the ACR"
  type        = set(string)
  default     = [""]
}
variable "acr_push_token_name" {
  description = "Name of the acr push token resource"
  type        = string
  default     = "pipeline-token"
}

variable "geo_replication_locations" {
  description = "List of azure locations where the container registry should be replicated."
  type        = set(string)
  default     = []
}

variable "zone_redundancy_enabled" {
  description = "determines whether geo_replication should be zone redundant"
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
 description = "Enabling public access for ACR. If this variable is set to 'false' then we need to set IP rules to blank (ip_rules = []) in the repository which will refer pkt-cloud-migration-tf-modules as source."
 type        = bool
 default     = false
}