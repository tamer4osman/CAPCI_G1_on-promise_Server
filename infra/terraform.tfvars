# ASSIGN VALUE TO VARIABLES
vpc_name             = "CAPCI-VPC"
public_subnet_name = "Public"
private_subnet_name = "Private"
amzn_ami_name        = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
amzn_ami_owner       = "099720109477"
on-promise_app_ec2_type   = "t3.medium"
keypair_name         = "talent-academy-ec2"
db_storage           = 10
db_name              = "on-promise_db"
db_engine            = "Postgresql"
db_engine_version    = "14.1"
db_instance_class    = "db.t4g.large"
db_username          = "root"