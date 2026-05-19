module "windows_vm" {
  source = "./modules/virtualmachine"

  resource_group_name = var.resource_group_name
  location            = var.location
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}
