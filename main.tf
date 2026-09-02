provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
}
terraform {
  backend "s3" {
    bucket = "backend-s3-capstone122"
    key    = "capstone project/terraform.tfstate"
    region = "us-east-1"
  }
}
module "vpc" {
  source = "./modules/vpc"
}
module "ec2" {
  source   = "./modules/ec2"
  vpc-sg   = [module.vpc.sg-id]
  subnet_a = module.vpc.pub_subnet_id
  subnet_b = module.vpc.pub2_subnet_id
  key      = module.vpc.key_name
}
module "asg" {
  source    = "./modules/asg"
  arn_id    = module.alb.alb_target_arn
  image_id  = module.ec2.image_id
  inst_type = module.ec2.inst_type
  key_name  = module.vpc.key_name
  sg_ids    = module.vpc.sg-id
  target_arn = module.alb.alb_target_arn
  subnet    = [module.vpc.pub_subnet_id, module.vpc.pub2_subnet_id]
}
module "alb" {
  source   = "./modules/alb"
  sg       = [module.vpc.sg-id]
  subnet   = [module.vpc.pub_subnet_id, module.vpc.pub2_subnet_id]
  vpc_id   = module.vpc.vpc_id
  target_1 = module.ec2.instance_id_a
  target_2 = module.ec2.instance_id_b
}
