output "bastion_public_ip" {
  value = aws_instance.bastion_host.public_ip
  description = "The public IP of the bastion host"
}

output "bastion_private_ip" {
  value = aws_instance.bastion_host.private_ip
  description = "The private IP of the bastion host"
}
