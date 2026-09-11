environment         = "prod"
location            = "East US"
resource_group_name = "rg-tf-prod-application"

vm_name                          = "vm-tf-prod-application"
vm_size                          = "Standard_D2s_v3"
admin_username                   = "azureuser"
# admin_password is retrieved from Azure Key Vault via a data source, e.g.:
# data "azurerm_key_vault_secret" "vm_admin_password" {
#   name         = "prod-vm-admin-password"
#   key_vault_id = data.azurerm_key_vault.this.id
# }
# # and referenced in the module as: admin_password = data.azurerm_key_vault_secret.vm_admin_password.value
key_vault_name                    = "kv-tf-deployments"
key_vault_resource_group_name     = "rg-tfstate-eus"
admin_password_secret_name        = "linux-admin-password"
disable_password_authentication  = false

os_publisher = "Canonical"
os_offer     = "0001-com-ubuntu-server-jammy"
os_sku       = "22_04-lts"
os_version   = "latest"

os_disk_caching              = "ReadWrite"
os_disk_storage_account_type = "Premium_LRS"
os_disk_size_gb              = 128

virtual_network_resource_group_name = "rg-vnet"
virtual_network_name       = "vnet-eus-1"
# virtual_network_name       = "vnet-eus-1"
# vnet_address_space    = ["10.10.0.0/16"]
subnet_name           = "snet-eus-1"
# subnet_address_prefix = ["10.10.1.0/24"]

network_interface_name    = "nic-tf-prod-application"
private_ip_address_allocation = "Dynamic"

# public_ip_name              = "pip-prod-vm"
# public_ip_allocation_method = "Static"
# public_ip_sku               = "Standard"

nsg_name = "nsg-tf-prod-application"

tags = {
  environment = "production"
  project     = "azure-tf-deployments"
  managed_by  = "terraform"
}
