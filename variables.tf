variable "env" {}
variable "location" {}

variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}

# ✅ VM MAP
variable "vm_config" {
  type = map(object({
    size = string
  }))
}

# ✅ Storage MAP
variable "storage_config" {
  type = map(string)
}
