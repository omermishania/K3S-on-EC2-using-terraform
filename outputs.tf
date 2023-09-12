# Output the instance ID of the created EC2 instance
output "instance_id" {
  description = "The ID of the created EC2 instance"
  value = aws_instance.k3s-ec2.id
}

# Output the public IP address of the created EC2 instance
output "public_ip" {
  description = "The public IP address of the created EC2 instance"
  value = aws_instance.k3s-ec2.public_ip
}

# Output the private IP address of the created EC2 instance
output "private_ip" {
  description = "The private IP address of the created EC2 instance"
  value = aws_instance.k3s-ec2.private_ip
}