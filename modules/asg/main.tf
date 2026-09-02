resource "aws_launch_template" "ec2_temp" {
  name = "asg_test"
  image_id = var.image_id
  instance_type = var.inst_type
  vpc_security_group_ids = [var.sg_ids]
  /**tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ec2_asg_instance"
    }
  }**/
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
  tag {
    key = "Name"
    value = "ec2_asg_instance"
    propagate_at_launch = true
  }
}
resource "aws_autoscaling_attachment" "alb_asg" {
  autoscaling_group_name = aws_autoscaling_group.my_asg.name
  lb_target_group_arn = var.target_arn
}