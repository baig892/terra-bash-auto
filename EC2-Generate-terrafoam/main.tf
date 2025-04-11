provider "aws" {
  region = "eu-north-1"  
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-security-group"
  description = "Allow SSH access to Bastion host"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "bastion_host" {
  ami                    = var.ami_id         
  instance_type          = var.instance_type 
  key_name               = var.key_name      
  subnet_id              = var.subnet_id     
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]  # Updated line
  
  tags = {
    Name = "Bastion Host"
  }
}
