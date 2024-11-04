resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]
  user_data     = file("${path.module}/userdata.sh")
}
