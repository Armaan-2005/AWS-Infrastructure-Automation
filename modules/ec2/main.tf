resource "aws_instance" "ec2" {
  ami = var.amazon
  instance_type = var.inst_type
  key_name = var.key
  subnet_id = var.subnet
  vpc_security_group_ids = var.vpc-sg
  tags = {
    Name = "module-test"
  }
}