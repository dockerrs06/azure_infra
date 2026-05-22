variable "env" {}
variable "location" {}

variable "vm_config" {
  type = map(object({
    size = string
  }))
}

variable "storage_config" {
  type = map(object({
    replication_type = string
  }))
}

variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}
