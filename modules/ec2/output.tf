output "instance_id" {
  value = aws_instance.ec2.id
}
output "instance_name" {
  value = aws_instance.ec2.tags
}
output "image_id" {
  value = var.ubuntu 
}
output "inst_type" {
  value = var.inst_type
}