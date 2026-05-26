
variable "env" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

# ✅ OPTIONAL: keep only if you use later
variable "vm_list" {
  type    = list(string)
  default = []
}
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
