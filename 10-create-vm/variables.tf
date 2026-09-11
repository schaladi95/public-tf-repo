variable "resource_group_name" {
  type        = string
  description = "The name of the application resource group"
  default     = "rg-tf-prod-application"
}
variable "subscription_id" {
  type        = string
  description = "Subscription ID where the resources will be deployed"
  default     = "9c87cf84-accd-43ff-9ce7-c8fa15b73aaf"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account for the Terraform state"
  default     = "stschaladi95tfstate"
}

variable "location" {
  type        = string
  description = "The Azure region for the resources"
  default     = "East US"
}

variable "virtual_network_resource_group_name" {
  type        = string
  description = "The name of the resource group where the virtual network is located"
  default     = "rg-vnet"
}
variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
  default     = "vnet-eus-1"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
  default     = "snet-eus-1"
}

variable "network_interface_name" {
  type        = string
  description = "The name of the network interface"
  default     = "nic-tf-prod-application"
}

variable "linux_virtual_machine_name" {
  type        = string
  description = "The name of the Linux virtual machine"
  default     = "vm-tf-prod-application"
}

variable "admin_username" {
  type        = string
  description = "The admin username for the Linux virtual machine"
  default     = "azureuser"
}

# Cannot call data.azurerm_key_vault_secret.linux_admin_password.value directly in the variable block because it is not allowed. Instead, we can use a local value to store the secret and then reference that local value in the variable block.
# data "azurerm_key_vault_secret" "linux_admin_password" {
#   name         = "linux-admin-password"
#   key_vault_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.KeyVault/vaults/kv-${var.storage_account_name}"
# }

# 1. Reference your existing Azure Key Vault
data "azurerm_key_vault" "kv-tf-deployments" {
  name                = "kv-tf-deployments"
  resource_group_name = "rg-tfstate-eus"
}

# 2. Fetch the specific secret from that Key Vault
data "azurerm_key_vault_secret" "linux_admin_password" {
  name         = "linux-admin-password"
  key_vault_id = data.azurerm_key_vault.kv-tf-deployments.id
}

# 3. Store the value in a local block (Acts as your variable)
# locals {
#   linux_admin_password = data.azurerm_key_vault_secret.linux_admin_password.value
# }

variable "admin_password" {
  type        = string
  description = "The admin password for the Linux virtual machine"
  default     = null
  sensitive   = true
}

locals {
  effective_linux_admin_password = coalesce(
    var.admin_password,
    data.azurerm_key_vault_secret.linux_admin_password.value
  )
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the resources"
  default = {
    environment = "production"
    project     = "azure-tf-deployments"
    managed_by  = "terraform"
  }
}