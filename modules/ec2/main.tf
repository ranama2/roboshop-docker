terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}

resource "aws_instance" "instance" {
  ami                     = var.ami_id
  instance_type           = var.instance_type
  vpc_security_group_ids  = var.vpc_security_group_ids

  # root_block_device {
  #   volume_size = var.root_volume_size
  # }

  tags = {
    Name    = var.name
  }
}

resource "aws_security_group" "main" {
  name         = "${var.name}-sg"
  description  = "${var.name}-sg"

  tags = {
    Name = "${var.name}-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "ssh"
}

# resource "aws_vpc_security_group_ingress_rule" "app_port" {
#   for_each          = var.ports
#   security_group_id = aws_security_group.main.id
#   cidr_ipv4         = "0.0.0.0/0"
#   from_port         = each.value
#   ip_protocol       = "tcp"
#   to_port           = each.value
#   description       = each.key
# }

resource "aws_vpc_security_group_egress_rule" "egress_allow_all" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_route53_record" "private" {
  name    = var.name
  type    = "A"
  zone_id = var.zone_id
  ttl     = 10
  records = [aws_instance.instance.private_ip]
}

resource "aws_route53_record" "public" {
  name    = var.name
  type    = "A"
  zone_id = var.zone_id
  ttl     = 10
  records = [aws_instance.instance.public_ip]
}
