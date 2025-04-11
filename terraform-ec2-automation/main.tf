provider "aws" {
  region = "eu-north-1"
}

module "ec2_instance" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  name          = var.name
}
