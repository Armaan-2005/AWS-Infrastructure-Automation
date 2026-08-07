provider "aws" {
  region = "us-east-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "default"
}
module "vpc" {
  source = "./modules/vpc"
}
module "ec2" {
  source = "./modules/ec2"
  vpc-sg = [module.vpc.sg-id]
  subnet = module.vpc.pub_subnet_id
  key    = module.vpc.key_name
}
module "s3" {
  source = "./modules/s3"
}
module "alb" {
  source = "./modules/alb"
  sg = [ module.vpc.sg-id ]
  subnet = [ module.vpc.pub_subnet_id,module.vpc.priv_subnet_id ]
}
