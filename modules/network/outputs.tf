output "virtual_network_id" {
  description = "ID of the virtual network."
  value       = data.azurerm_virtual_network.vnet.id
}

output "virtual_network_name" {
  description = "Name of the virtual network."
  value       = data.azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  description = "ID of the subnet."
  value       = data.azurerm_subnet.subnet.id
}

output "subnet_name" {
  description = "Name of the subnet."
  value       = data.azurerm_subnet.subnet.name
}

output "network_interface_id" {
  description = "ID of the network interface."
  value       = azurerm_network_interface.nic.id
}

output "network_interface_name" {
  description = "Name of the network interface."
  value       = azurerm_network_interface.nic.name
}
