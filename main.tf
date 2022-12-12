data "aws_ami" "aws_ubuntu" {
  owners      = [var.ami_owner_id] #ami owner
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_name]
  }
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "public_subnet" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_name]
  }
}

data "aws_subnet" "privat_subnet" {
  filter {
    name   = "tag:Name"
    values = [var.privat_subnet_name]
  }
}

data "aws_internet_gateway" "igw" {
  filter {
    name   = "tag:Name"
    values = [var.internet_gateway_name]
  }
}

data "aws_nat_gateway" "nat-gw" {
  filter {
    name   = "tag:Name"
    values = [var.nat_gateway_name]
  }
}