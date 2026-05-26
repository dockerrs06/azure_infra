variable "env" {
  description = "Environment name (dev, test, prod)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
}

variable "admin_username" {
  description = "Admin username for VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for VM"
  type        = string
  sensitive   = true
}

# Optional (only if used later)
variable "vm_list" {
  description = "List of VM names (optional)"
  type        = list(string)
  default     = []
}

# AKS variables
variable "aks_node_count" {
  description = "AKS node count"
  type        = number
  default     = 1
}

variable "aks_vm_size" {
  description = "AKS VM size"
  type        = string
  default     = "Standard_D2_v2"
}
``
