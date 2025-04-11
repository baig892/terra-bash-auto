variable "region" {
  description = "The AWS region where the resources will be created"
  default     = "eu-north-1"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  default     = "ami-0c1ac8a41498c1a9c"
}

variable "instance_type" {
  description = "The type of EC2 instance"
  default     = "t3.micro"  
}

variable "key_name" {
  description = "The SSH key pair name for accessing the EC2 instance"
  default     = "two-tier-app-k8s"  
}

variable "subnet_id" {
  description = "The subnet ID where the EC2 instance will be launched"
  default     = "subnet-017521d4d04507317"  
}

variable "ssh_allowed_cidr" {
  description = "CIDR block to allow SSH access from"
  default     = "0.0.0.0/0"  
}
