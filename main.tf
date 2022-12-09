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

resource "aws_key_pair" "my-keypair" {
  key_name   = "my-keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDWKq2T3LmvbkfxdzzCFKGrPNrOTzy6DZ+0LTzuDOVQzFZf4Cs7YhcI14mZI59mqaBp7TTunZHkwlsyiLcyht90m3YynvQM6BfT/7PvHhqMXANwzLuklVYdRUM+OukOisuaF67ayGMgVAKShhvvIJC7IAlUuNOeQXi/5bLaoChayw60wtXe/2BEj1r4k2m1OLrGjmBZpkCSU0pBwwGVBpvooZTvQRSoB8Zzls+SrJySIVTbv+XZf9QZ7rVyE8WCHEQMGq/ktKiRvzwwsGBZvfKyEhPVKe6r8di04ZD+l3k+FFXVebmA+wIcNZZhYdOpO+hXuAr+bcNd9Y33JvColnzNgVcos5+021aFp0aPKZ0YHnhq7d+1VgNNjFYE/a1tPAKbxjzAZSUvzJ53oJ20vn59vykssj1vkGAF1JazGJYSi5MKYWxPRzD+PgVWrEtwJXSJD6s2XVSEQLi76YMn0tZZYV91Ho3YkxL0LzuO8rAdxHRIscuSlhX3IozdOMXa5Es= olga.matusik@Olga-Matusik's-MacBook---CYH4QPK7FDß"
}