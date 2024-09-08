variable "tags" {
  type        = map(string)
  description = "resource's tag"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type        = string
  description = ""
}

variable "ec2_key_name" {
  type = string
}

variable "ec2_private_key" {
  type        = string
  sensitive   = true
  description = "private key path relative to the ansible  execution"
  default     = "../private_key"
}

variable "ec2_default_user" {
  type    = string
  default = "ubuntu"
}

variable "ssh_config_path" {
  type      = string
  sensitive = false
  default   = "../ansible/config"
}
