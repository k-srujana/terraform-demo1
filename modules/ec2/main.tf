resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id

  iam_instance_profile = var.iam_role

  tags = {
    Name = var.name
  }
}