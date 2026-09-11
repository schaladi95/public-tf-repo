output "resource_group_name" {
  description = "Name of the deployed resource group."
  value       = azurerm_resource_group.rg.name
}

output "virtual_network_name" {
  description = "Name of the deployed virtual network."
  value       = module.network.virtual_network_name
}

output "subnet_name" {
  description = "Name of the deployed subnet."
  value       = module.network.subnet_name
}

output "network_interface_name" {
  description = "Name of the deployed network interface."
  value       = module.network.network_interface_name
}

output "linux_virtual_machine_name" {
  description = "Name of the deployed Linux virtual machine."
  value       = module.linux_vm.vm_name
}

output "linux_admin_password" {
  description = "Admin password for the deployed Linux virtual machine."
  value       = local.effective_linux_admin_password
  sensitive   = true
}