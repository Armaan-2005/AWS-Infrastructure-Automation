output "instance_id_a" {
  value = aws_instance.ec2_1.id
}
output "instance_id_b" {
  value = aws_instance.ec2_2.id
}
output "instance_name_a" {
  value = aws_instance.ec2_1.tags
}
output "instance_name_b" {
  value = aws_instance.ec2_2.tags
}
output "image_id" {
  value = var.ubuntu 
}
output "inst_type" {
  value = var.inst_type
}