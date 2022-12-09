# VPC of CAPCI Lab account
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

# Public Subnet
data "aws_subnet" "public_subnet" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_name]
  }
}

# AMI FOR UBUNTU image
data "aws_ami" "aws_ubuntu_image" {
  most_recent = true
  owners      = [var.amzn_ami_owner]

  filter {
    name   = "name"
    values = [var.amzn_ami_name]
  }
}

# Private Subnets
data "aws_subnet" "private_subnet" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_name]
  }
}

# Get Database Password
data "aws_secretsmanager_secret" "on-promise_db_secret" {
  name = "on-promise-db-password"
}

data "aws_secretsmanager_secret_version" "on-promise_db_pw" {
  secret_id = data.aws_secretsmanager_secret.on-promise_db_secret.id
}