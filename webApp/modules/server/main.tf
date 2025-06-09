resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.size
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_groups
  key_name  = var.key_name

  tags = {
    "Name"        = "Server Module"
    "Environment" = "Test"
  }
}