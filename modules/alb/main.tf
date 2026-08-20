resource "aws_alb" "my-alb" {
  name = "load-balance"
  load_balancer_type = "application"
  subnets = var.subnet
  security_groups = var.sg
}
resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_alb.my-alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.lb_target.arn
    type = "forward"
  }
}
resource "aws_lb_target_group" "lb_target" {
  target_type = "instance"
  name = "targetgrp"
  protocol = "HTTP"
  port = 80
  vpc_id = var.vpc_id
  health_check {
    path = "/"
    protocol = "HTTP"
  }
}