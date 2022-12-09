variable "keypair_name" {
  description = "name of a keypair"
}
variable "instance_type" {
  description = "type of an instance used for ec2"
}
variable "ami_owner_id" {
  description = "ID of ami owner"
}
variable "ami_name" {
  description = "Name of ami"
}
variable "vpc_name" {
    description = "Name of VPC for the on-prem database"
}
variable "public_subnet_name" {
    description = "Name of a public subnet"
}
variable "privat_subnet_name" {
    description = "Name of a private subnet"
}
variable "internet_gateway_name" {
    description = "Name of a internet gateway for the vpc"
}
variable "nat_gateway_name" {
    description = "Name of a NAT gateway"
}