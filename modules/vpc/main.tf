resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}
resource "aws_subnet" "priv_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
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