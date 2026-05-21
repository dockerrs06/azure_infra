variable "env" {}
variable "location" {}

variable "vm_name" {}
variable "admin_username" {}

variable "admin_password" {
  sensitive = true
}

variable "vm_list" {
  type = list(string)
}
