variable "env" {}
variable "location" {}


variable "admin_username" {}

variable "admin_password" {
  sensitive = true
}

variable "vm_list" {
  type = list(string)
}
