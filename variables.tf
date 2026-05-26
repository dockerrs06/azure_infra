variable "env" {
  description = "Environment name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

# =========================
# VM VARIABLES
# =========================
variable "vm_name" {
  type    = string
  default = ""
}

variable "admin_username" {
  type    = string
  default = ""
}

variable "admin_password" {
  type      = string
  sensitive = true
  default   = ""
}

# =========================
# AKS VARIABLES
# =========================
variable "aks_node_count" {
  type    = number
  default = 1
}

variable "aks_vm_size" {
  type    = string
  default = "Standard_D2_v2"
}

# =========================
# FEATURE FLAGS
# =========================
variable "enable_vm" {
  description = "Enable VM deployment"
  type        = bool
  default     = false
}

variable "enable_aks" {
  description = "Enable AKS deployment"
  type        = bool
  default     = true
}
