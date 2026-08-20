resource "aws_launch_template" "ec2_temp" {
  name = "asg_test"
  image_id = var.image_id
  instance_type = var.inst_type
  vpc_security_group_ids = [var.sg_ids]
  tags = {
    Name = "asg_instance"
  }
}
resource "aws_autoscaling_group" "my_asg" {
    name = "Scaling"
    launch_template {
    id = aws_launch_template.ec2_temp.id
    version = "$Latest"
  }
  vpc_zone_identifier = var.subnet
  desired_capacity = 1
  min_size = 1
  max_size = 10
target_group_arns = [var.arn_id]
}