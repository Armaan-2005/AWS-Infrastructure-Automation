resource "aws_alb" "my-alb" {
  name = "load-balance"
  load_balancer_type = "application"
  subnets = var.subnet
  security_groups = var.sg
}