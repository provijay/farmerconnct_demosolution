variable client_id {
  type        = string
  description = "Client ID of Service prinicpal in Subscription"
}
variable object_id {
  type        = string
  description = "Object ID of Service prinicpal in Subscription"
}
variable client_secret {
  type        = string
  description = "Client Secert of Service prinicpal in Subscription"
}
variable tenant_id {
  type        = string
  description = "tenant ID of the Subscription"
}
variable subscription_id {
  type        = string
  description = "Subscription ID  "
}
variable resource_group_name {
  type        = string
  description = "AKS hosting resource group name in azure"
}
variable location {
  type        = string
  description = "The location where the resource group should be created.."
}
variable log_analyticsws_name {
  type        = string
  description = "log analytics worskpace name"
}
variable vnet_name {
  type        = string
  description = "vnet name "
}
variable aks_subnet_name {
  type        = string
  description = "aks subnet name"
}
variable aks_name {
  type        = string
  description = " The name of the Azure Kubernetes Service."
  default     = ""
}
variable dns_prefix {
  type        = string
  description = "DNS prefix "
  default     = ""
}
variable kubernetes_version {
  type        = string
  description = "Ver of Kubernetes"
}
variable node_pool_name {
  type        = string
  description = " Node Pool name "
  default     = "default"
}
variable node_pool_count {
  type        = number
  description = " Number of pool virtual machines to create "
}
variable node_pool_vm_size {
  type        = string
  description = " VM Size to create in the default node pool. "
}
variable node_pool_os_disk_size_gb {
  type        = number
  description = " The size of the OS Disk "
}
variable node_pool_max_pods {
  type        = number
  description = " The maximum number of pods that can run on each agent."
}
variable node_pool_type {
  type        = string
  description = " The type of Node Pool which should be created. "
  default     = "VirtualMachineScaleSets"
}
variable auto_scaling_min_count {
  type        = number
  description = " The minimum number of nodes which should exist in this Node Pool."
}
variable auto_scaling_max_count {
  type        = number
  description = " The maximum number of ndes which should exist in this Node Pool."
}
variable kube_dashboard_enabled {
  type        = bool
  description = "Is the Kubernetes Dashboard enabled?"
  default     = true
}
variable network_plugin {
  type        = string
  description = " Network plugin to use for networking."
  default     = "azure"
}
variable network_docker_bridge_cidr {
  type        = string
  description = " IP address used as the Docker bridge IP address on nodes. "
  default     = ""
}
variable aks_service_cidr {
  type        = string
  description = " The service cidr"
  default     = ""
}
variable dns_service_ip {
  type        = string
  description = " The dns service ip"
  default     = ""
}
variable network_policy {
  type        = string
  description = "network policy to be used with Azure CNI."
  default     = "calico"
}
/* variable rbac_aad_admin {
  type        = list
  description = " Azure Active Directory group Id for AKS Admin role"
  default = []
} */
variable linux_admin_username {
  type        = string
  description = " The Admin Username for the Cluster. "
  default     = "aksadmin"
}
variable linux_ssh_key {
  type        = string
  description = " The Public SSH Key used to access the cluster."
}
variable enable_pod_security_policy {
  type        = bool
  description = "Enables http application routing"
  default     = false
}


