resource "aws_instance" "ec2_1" {
  ami = var.amazon
  instance_type = var.inst_type
  key_name = var.key
  subnet_id = var.subnet_a
  vpc_security_group_ids = var.vpc-sg
  associate_public_ip_address = true
  tags = {
    Name = "ec2-alb_1-test"
  }
}
resource "aws_instance" "ec2_2" {
  ami = var.amazon
  instance_type = var.inst_type
  key_name = var.key
  subnet_id = var.subnet_b
  vpc_security_group_ids = var.vpc-sg
  associate_public_ip_address = true
  tags = {
    Name = "ec2-alb_2-test"
  }
}