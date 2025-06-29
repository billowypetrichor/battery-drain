locals {
  tags = {
    project_name = "battery-drain"
    owner        = "andrei.babiciu@gmail.com"
    managed_by   = "Terraform"
    environment  = var.env_name
  }
}