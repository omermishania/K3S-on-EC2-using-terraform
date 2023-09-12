variable "region" {
  type        = string
  description = "AWS region where the resources will be provisioned."
  # No default value; should be specified explicitly
}

variable "instance_ami" {
  type        = string
  description = "The AMI to use for the instance"
  # No default value; should be specified explicitly
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC that the instance security group belongs to"
  # No default value; should be specified explicitly
}

variable "user_data" {
  type        = string
  description = "Instance user data. Provide the path to the file"
  # No default value; should be specified explicitly
}

variable "instance_type" {
  type        = string
  description = "The type of the instance"
  # No default value; should be specified explicitly
}

variable "ssh_key_pair" {
  type        = string
  description = "SSH key pair to be provisioned on the instance"
  # No default value; should be specified explicitly
}

variable "market_type" {
  type        = string
  description = "The market type the instance (spot/on-demand)"
  # No default value; should be specified explicitly
}

variable "private_ips" {
  type        = list(string)
  description = "Private IP address to associate with the instances in the VPC"
  # No default value; should be specified explicitly
}

variable "cidr_block" {
  type        = string
  description = "Private IP address to associate with the instances in the VPC"
  # No default value; should be specified explicitly
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone the instance is launched in. If not set, will be launched in the first AZ of the region"
  # No default value; should be specified explicitly
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address with the instance"
  # No default value; should be specified explicitly
}

variable "instance_name" {
  type        = string
  description = "Name of the EC2 instance"
  # No default value; should be specified explicitly
}

variable "security_groups" {
  type        = list(string)
  description = "A list of Security Group names to associate with EC2 instances."
  # No default value; should be specified explicitly
}

variable "security_group_name" {
  type        = string
  description = <<-EOT
    The name to assign to the security group. Must be unique within the VPC.
    If not provided, will be derived from the `null-label.context` passed in.
    If `create_before_destroy` is true, will be used as a name prefix.
    EOT
  # No default value; should be specified explicitly
}

variable "security_group_description" {
  type        = string
  description = "The Security Group description."
  # No default value; should be specified explicitly
}

variable "security_group_rules" {
  type = map(object({
    type        = string
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  description = "Map of security group rules"
  # No default value; should be specified explicitly
}
