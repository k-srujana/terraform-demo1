provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet  = "10.0.3.0/24"
}

module "ec2" {
  source = "../../modules/ec2"

  ami               = "ami-0f58b397bc5c1f2e8"
  instance_type     = "t3.micro"
  private_subnet_id = module.vpc.private_subnet_id
  iam_role          = "ssm-role"
  name              = "dev-server"
}

module "alb" {
  source = "../../modules/alb"

  vpc_id         = module.vpc.vpc_id
   public_subnets = module.vpc.public_subnet_ids
}