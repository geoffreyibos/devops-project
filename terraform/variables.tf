variable "aws_region" {
  type    = string
  default = "eu-west-3"
}

variable "project_name" {
  type    = string
  default = "devops-s8"
}

variable "app_instance_count" {
  type    = number
  default = 2
}

variable "db_username" {
  type    = string
  default = "appuser"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/devops_s8.pub"
}

variable "allowed_ssh_cidr" {
  type = string
}

