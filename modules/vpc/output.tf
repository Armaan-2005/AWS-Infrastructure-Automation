output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "pub_subnet_id" {
  value = aws_subnet.pub_subnet.id
}
output "priv_subnet_id" {
  value = aws_subnet.priv_subnet.id
}
