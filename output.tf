output "vpc_id" {
  value = module.vpc.vpc_id
}
output "sg_id" {
  value = module.vpc.sg-id
}
output "key_name" {
  value = module.vpc.key_name
}
output "instance_id" {
  value = [module.ec2.instance_id_a, module.ec2.instance_id_b]
}
output "instance_name_1a" {
  value = module.ec2.instance_name_a
}
output "instance_name_1b" {
  value = module.ec2.instance_name_b
}
output "alb_id" {
  value = module.alb.alb_id
}
output "alb_name" {
  value = module.alb.alb_name
}
output "asg_id" {
  value = module.asg.asg_id
}