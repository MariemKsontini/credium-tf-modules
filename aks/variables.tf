variable "subnet_id" {
  description = "Azure resources id of the subnet where the aks is created in"
  type        = string
}

variable "rg_name" {
  description = "Name of an existing resource group. The resource will be created in the same location as the resource group"
  type        = string
}

variable "location" {
  description = "Azure location where the resources are deployed in"
  type        = string
  default     = "westeurope"
}

variable "tags" {
  description = "This Object is used to store information about the running deployment. Resources will be tagged with it. (Further information can be found [here](https://atc.bmwgroup.net/confluence/pages/viewpage.action?spaceKey=ARCHINNO&title=Terraform+Guidelines))"
  type        = map(string)
}

variable "aks_name" {
  description = "Name of the AKS"
  type        = string
}

variable "dns_prefix" {
  description = "Prefix of the DNS"
  type        = string
}

variable "node_resource_group_name" {
  description = "Name of the node resource group"
  type        = string
  default     = null
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.22.4"
}

variable "orchestrator_version" {
  description = "Orchestrator version"
  type        = string
  default     = "1.22.4"
}

variable "node_pool_name" {
  description = "Name of the AKS node pool"
  type        = string
}

variable "node_pool_count" {
  description = "The number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000. Required if enable_auto_scale is set to `false`"
  type        = number
  default     = 3
}

variable "node_pool_vm_size" {
  description = "VM size of the AKS node pool"
  type        = string
  default     = "Standard_B2s"
}

variable "node_labels" {
  type = map(string)
  default = {
    system = true
  }
  description = "A map of Kubernetes labels which should be applied to nodes in the Default Node Pool. Changing this forces a new resource to be created."
}

variable "sku" {
  description = "SKU of AKS API Server. 'Free'= 99,95% or 'Paid' = 99,9%"
  type        = string
  default     = "Free"
}

variable "only_critical_addons_enabled" {
  description = "only critical addons enabled for default node pool"
  type        = bool
  default     = false
}

variable "user_assigned_identity_id" {
  description = "User assigned identity id that is used to create the AKS cluster in the BMW Vnet"
  type        = string
}

variable "enable_auto_scaling" {
  description = "Enable autoscaling on vm node pool. When set to true max_count and min_count needs to be defined"
  type        = bool
  default     = true
}

variable "os_disk_size_gb" {
  description = "The size of the OS Disk which should be used for each agent in the Node Pool. Changing this forces a new resource to be created"
  type        = number
  default     = 64
}

variable "min_count" {
  description = "The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000. Required if enable_auto_scale is set to `true`"
  type        = number
  default     = 3
}

variable "max_count" {
  description = "The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000. Required if enable_auto_scale is set to `true`"
  type        = number
  default     = 6
}

variable "enable_oms_agent" {
  description = "Enable the OMS agent to make use of the container monitoring. If set to true a log analytics workspace id is required"
  type        = bool
  default     = false
}

variable "log_analytics_workspace_id" {
  description = "Id of an exiting log analytics workspace. Is required if 'enable_oms_agent' is set to `true`"
  type        = string
  default     = null
}

variable "automatic_channel_upgrade" {
  description = "The upgrade channel for this Kubernetes Cluster"
  type        = string
  default     = null
}

variable "pod_cidr_range" {
  description = "Valid CIDR range for pod IP assignments inside the cluster. Relevant for multiple clusters (blue-green) in one VNet. First cluster can use e.g. '10.244.0.0/16', second one '10.245.0.0/16'. Please check https://atc.bmwgroup.net/confluence/display/OTDLPA/Two+AKS-Clusters+in+the+same+VNET+with+network-plugin+kubenet+be+aware for more details."
  type        = string
}

variable "max_surge" {
  type        = string
  description = "The maximum number or percentage of nodes which will be added to the Node Pool size during an upgrade"
}

variable "additional_node_pools" {
  description = "Map object to configure one or several additional node pools. The name of each map object is used as the node pool name. if `vm_size` and `os_disk_size_gb` are set to `null` the values for the default node pool will be used."
  type = map(object({
    node_count          = number
    vm_size             = string
    labels              = map(string)
    taints              = list(string)
    availability_zones  = list(string)
    enable_auto_scaling = bool
    node_min_count      = number
    node_max_count      = number
    os_disk_size_gb     = number
  }))
  default = {}
}

variable "availability_zones" {
  type        = list(string)
  default     = null
  nullable    = true
  description = "Array of availability zones for the default system node pool. Setting this to `null` results in Azure picking zone 0."
}

variable "os_disk_type" {
  type        = string
  default     = "Managed"
  description = "Possible values: Ephemeral, Managed. The type of disk which should be used for the Operating System."
}

variable "node_os_channel_upgrade" {
  description = "The upgrade channel for the node OS. This controls when update will be applied to the node."
  type        = string
  default     = null
}

variable "maintenance_window_node_os" {
  description = "Maintenance window configuration for node OS upgrades."
  type = object({
    day_of_month = optional(number)
    day_of_week  = optional(string)
    duration     = number
    frequency    = string
    interval     = number
    start_date   = optional(string)
    start_time   = optional(string)
    utc_offset   = optional(string)
    week_index   = optional(string)

    not_allowed = optional(set(object({
      end   = string
      start = string
    })))
  })
  default = null
}
