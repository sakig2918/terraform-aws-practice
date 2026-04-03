provider "aws" {
  region = "ap-northeast-1"
  }

module "network"{
    source = "./modules/network"

    vpc_name = "3.23vpc"
    subnet_name = "3.23subnet"

    vpc_cidr = "10.0.0.0/16"
    subnet_cidr = "10.0.0.0/24"
}

module "compute" {
  source = "./modules/compute"
  subnet_id = module.network.subnet_id
  vpc_id = module.network.vpc_id
  instance_name = "test-ec2"
}