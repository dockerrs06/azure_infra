
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
