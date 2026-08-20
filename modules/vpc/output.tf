output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "pub_subnet_id" {
  value = aws_subnet.pub_subnet.id
}
output "pub2_subnet_id" {
  value = aws_subnet.pub2_subnet.id
}
output "priv_subnet_id" {
  value = aws_subnet.priv_subnet.id
}
output "sg-id" {
  value = aws_security_group.my_sg.id
}
output "key_name" {
  value = aws_key_pair.key_pair.key_name
}
output "az" {
  value = aws_subnet.pub_subnet.availability_zone
}