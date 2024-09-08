resource "aws_instance" "public" {

  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.ec2_key_name
  subnet_id                   = aws_subnet.public.id
  security_groups             = [aws_security_group.public.id]
  associate_public_ip_address = true
  availability_zone           = "eu-west-3a"
  private_ip                  = "10.0.1.4" # aws subnet reserves 4 first ip address
  user_data                   = "name=public"

  root_block_device {
    volume_size = 10
  }
  tags =  var.tags
}

