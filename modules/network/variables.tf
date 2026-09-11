variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where networking resources will be created."
}
variable "virtual_network_resource_group_name" {
  type        = string
  description = "Name of the resource group where the virtual network is located."
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network."
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet."
}

variable "location" {
  type        = string
  description = "Azure region for the networking resources."
}


variable "address_space" {
  type        = list(string)
  description = "Address space for the virtual network."
  default     = ["10.0.0.0/16"]
}


variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the subnet."
  default     = ["10.0.1.0/24"]
}

variable "network_interface_name" {
  type        = string
  description = "Name of the network interface."
}
