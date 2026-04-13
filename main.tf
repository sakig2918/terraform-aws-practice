provider "aws" {
  region = "ap-northeast-1"
  }

module "network"{
    source = "./modules/network"

    vpc_cidr = "10.0.0.0/16"
    vpc_name = "3.23vpc"
    
    subnet_1_cidr = "10.0.0.0/24"
    subnet_1_name = "public-subnet-1"
    subnet_1_az = "ap-northeast-1a"
    
    subnet_2_cidr = "10.0.1.0/24"
    subnet_2_name = "public-subnet-2"
    subnet_2_az = "ap-northeast-1c"
}

module "compute" {
  source = "./modules/compute"
  subnet_id = module.network.subnet_1_id
  vpc_id = module.network.vpc_id
  instance_name = "test-ec2"
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.network.vpc_id
  subnet_1_id = module.network.subnet_1_id
  subnet_2_id = module.network.subnet_2_id
  instance_id = module.compute.instance_id
}