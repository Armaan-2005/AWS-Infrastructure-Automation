module "aws" {
  source = "./modules/provider"
}
module "vpc" {
  source = "./modules/vpc"
}
module "key" {
  source = "./modules/key"
}
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}
module "ec2" {
  source = "./modules/ec2"
  vpc-sg = [module.sg.my-sg_id]
  subnet = module.vpc.pub_subnet_id
  key    = module.key.key_id
}
module "s3" {
  source = "./modules/s3"
}
module "alb" {
  source = "./modules/alb"
  sg = [ module.sg.my-sg_id ]
  subnet = [ module.vpc.pub_subnet_id,module.vpc.priv_subnet_id ]
}