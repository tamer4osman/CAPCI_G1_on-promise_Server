resource "aws_db_instance" "on-promise_db" {
  allocated_storage    = var.db_storage
  db_name              = var.db_name
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.on-promise_db_pw.secret_string))["on-promise_db_password"]
  skip_final_snapshot  = var.db_skip_last_snapshot
  db_subnet_group_name  = aws_db_subnet_group.db_subnet_group.id
  vpc_security_group_ids = [aws_security_group.db_on-promise_sg.id]
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "on-promise-db-subnet-grp"
  subnet_ids = [ data.aws_subnet.private_subnet.id, data.aws_subnet.private_subnet.id]

  tags = {
    Name = "on-promise-db-subnet-grp"
  }
}
