# datasource ami for the ec2

data "aws_ami" "ami_name" {
  owners      = [var.ami_owner_id] #ami owner
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_name]
  }
}

#ec2 for web server
resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.ami_name.id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.public_subnet.id
  key_name               = aws_key_pair.my-keypair.key_name 
  vpc_security_group_ids = [aws_security_group.web_security_group.id]
  user_data = base64encode(templatefile("${path.module}/user-data-web.sh",
    {
      PGADMIN_SETUP_EMAIL    = "admin@example.com",
      PGADMIN_SETUP_PASSWORD = "password"
  }))

  tags = {
    Name = "ec2-webserver"
  }
}

#ec2 for DB
resource "aws_instance" "ec2_db" {
  ami                    = data.aws_ami.ami_name.id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.privat_subnet.id
  key_name               = aws_key_pair.my-keypair.key_name 
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
  user_data              = base64encode(templatefile("${path.module}/user-data-db.sh", {}))

  tags = {
    Name = "ec2-database"
  }
}