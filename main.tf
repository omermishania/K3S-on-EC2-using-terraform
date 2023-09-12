# Provider Configuration
provider "aws" {
  region = var.region
}

resource "aws_instance" "k3s-ec2" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = var.ssh_key_pair
  user_data                   = "${file(var.user_data)}"
  associate_public_ip_address = var.associate_public_ip_address

  instance_market_options {
    market_type   = var.market_type
  }

  tags = {
    Name = var.instance_name
  }

  security_groups = var.security_groups
}

resource "aws_security_group" "k3s-sg" {
  name        = var.security_group_name
  description = var.security_group_description
}

resource "aws_security_group_rule" "custom-rules" {
  for_each = var.security_group_rules

  description        = each.value.description
  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.k3s-sg.id
  depends_on        = [aws_security_group.k3s-sg]
}