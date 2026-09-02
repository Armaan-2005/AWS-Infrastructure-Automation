output "asg_id"{
    value = aws_autoscaling_group.my_asg.id
}
output "temp_ec2" {
  value = aws_launch_template.ec2_temp.id
}