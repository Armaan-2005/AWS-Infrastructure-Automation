resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "project_vpc"
  }
}
resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Public"
  }
}
resource "aws_subnet" "priv_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private"
  }
}
resource "aws_subnet" "pub2_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"
}
resource "aws_internet_gateway" "internet" {
  vpc_id = aws_vpc.my_vpc.id
}
resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.my_vpc.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet.id
  }
}
resource "aws_route_table_association" "route" {
    subnet_id = aws_subnet.pub_subnet.id
    route_table_id = aws_route_table.routetable.id
}
resource "aws_route_table_association" "route2" {
    subnet_id = aws_subnet.pub2_subnet.id
    route_table_id = aws_route_table.routetable.id
}
resource "aws_security_group" "my_sg" {
    vpc_id = aws_vpc.my_vpc.id
    description = "SSH,HTTP,HTTPS"
  ingress {
    description = "ssh"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }
  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }
  ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }
  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
  }
}
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits = 2048
}
resource "local_file" "priv_key" {
    filename = "my-key.pem"
    content = tls_private_key.key.private_key_pem
}
resource "aws_key_pair" "key_pair" {
  key_name = "my_key"
  public_key = tls_private_key.key.public_key_openssh
}