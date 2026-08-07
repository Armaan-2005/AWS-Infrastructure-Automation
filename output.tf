output "vpc_id" {
  value = module.vpc.vpc_id
}
output "sg_id" {
  value = module.vpc.sg-id
}
output "public-subnet" {
  value = module.vpc.pub_subnet_id
}
output "private_subnet" {
  value = module.vpc.priv_subnet_id
}
output "key_name" {
  value = module.vpc.key_name
}
output "instance_id" {
  value = module.ec2.instance_id
}
output "instance_name" {
  value = module.ec2.instance_name
}
output "alb_id" {
  value = module.alb.alb_id
}
output "bucket_name" {
  value = module.s3.bucket-name
}