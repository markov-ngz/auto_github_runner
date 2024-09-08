terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
    local = {
      source = "hashicorp/local"
    }

  }
  required_version = ">= 1.2.0"
  backend "s3" {
    bucket = "<bucket_name>"
    key    = "<path_to_state"
    region = "<region>"
  }
}

provider "aws" {
  region = "eu-west-3"
}

# Setup SSH config that will be automatically read by ansible inventory
resource "local_file" "foo" {
  content  = <<EOT
Host *
ForwardAgent yes
Host gh_runner
    Hostname ${aws_instance.public.public_ip}
    User ${var.ec2_default_user}
    IdentityFile ${var.ec2_private_key}
    Port 22
EOT 
  filename = "${var.ssh_config_path}"
}