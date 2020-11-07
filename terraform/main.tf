provider "azurerm" {
  features {}
  skip_provider_registration = false
}
provider "kubernetes" {
}
provider "azuread" {
}
provider "random" {
}
# define the password
resource "random_string" "password" {
  length  = 32
  special = true
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.28.0"
    }
  }
  required_version = ">= 0.13"
}
data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_log_analytics_workspace" "logws" {
  name                = var.log_analyticsws_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.1.0.0/16"]
}
resource "azurerm_subnet" "aks_sub" {
  name                 = var.aks_subnet_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["10.1.0.0/24"]
}
resource "azurerm_container_registry" "acr" {
  name                = "vjtestaksregistry"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}
resource "azurerm_role_assignment" "aks_sp_container_registry" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = var.object_id
  depends_on           = [azurerm_container_registry.acr]
}
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                  = var.node_pool_name
    node_count            = var.node_pool_count
    enable_node_public_ip = false
    vm_size               = var.node_pool_vm_size
    max_pods              = var.node_pool_max_pods
    os_disk_size_gb       = var.node_pool_os_disk_size_gb
    availability_zones    = ["1", "2", "3"]
    vnet_subnet_id        = azurerm_subnet.aks_sub.id # local.cluster_subnet_id
    enable_auto_scaling   = true
    min_count             = var.auto_scaling_min_count
    max_count             = var.auto_scaling_max_count

  }
  linux_profile {
    admin_username = var.linux_admin_username
    ssh_key {
      key_data = var.linux_ssh_key
    }
  }
  network_profile {
    network_plugin     = "azure"
    network_policy     = "calico"
    dns_service_ip     = var.dns_service_ip
    docker_bridge_cidr = var.network_docker_bridge_cidr
    service_cidr       = var.aks_service_cidr
    load_balancer_sku  = "standard"
  }
  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed                = true
      tenant_id              = var.tenant_id
      admin_group_object_ids = ["66b25d1e-7834-4a1b-bb00-c572d2eb29b6"] #[var.rbac_aad_admin]
    }
  }
  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
  addon_profile {
    http_application_routing {
      enabled = true
    }
    azure_policy {
      enabled = true
    }
    kube_dashboard {
      enabled = true
    }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.logws.id
    }
  }
}
