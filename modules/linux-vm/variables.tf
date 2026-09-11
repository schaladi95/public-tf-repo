variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where the virtual machine will be created."
}

variable "location" {
  type        = string
  description = "Azure region for the virtual machine."
}

variable "vm_name" {
  type        = string
  description = "Name of the Linux virtual machine."
}

variable "vm_size" {
  type        = string
  description = "Size of the Linux virtual machine."
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the virtual machine."
}

variable "admin_password" {
  type        = string
  description = "Admin password for the virtual machine."
  sensitive   = true
}

variable "admin_password_secret_name" {
  type        = string
  description = "Name of the secret in Azure Key Vault that contains the admin password for the virtual machine."
  default     = null
}

variable "key_vault_name" {
  type        = string
  description = "Name of the Azure Key Vault where the admin password secret is stored."
  default     = null
}

variable "key_vault_resource_group_name" {
  type        = string
  description = "Name of the resource group where the Azure Key Vault is located."
  default     = null
}

variable "network_interface_ids" {
  type        = list(string)
  description = "IDs of the network interfaces to attach to the virtual machine."
}

variable "os_disk_caching" {
  type        = string
  description = "Caching option for the OS disk."
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  type        = string
  description = "Storage account type for the OS disk."
  default     = "Standard_LRS"
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  description = "Source image reference for the virtual machine."
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the virtual machine."
  default     = {}
}
