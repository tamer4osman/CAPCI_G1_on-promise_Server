resource "aws_security_group" "on-promise_app_sg" {
  name        = "on-promise-app-sg"
  description = "SG for our on-promise mgmt Application"
  vpc_id      = data.aws_vpc.vpc.id

  # INBOUND 
  ingress {
    description = "Access to our Flask app"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH connection into the server"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  # OUTBOUND
  egress {
    description = "Access to the internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # BOTH TCP and UDP PROTOCOL
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "on-promise-app-sg"
  }
}

resource "aws_security_group" "db_on-promise_sg" {
  name        = "on-promise-db-sg"
  description = "SG for our on-promise mgmt Database"
  vpc_id      = data.aws_vpc.vpc.id

  # INBOUND 
  ingress {
    description = "Access to our Flask app"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.on-promise_app_sg.id]
  }

  ingress {
    description = "Access to our Flask app"
    from_port   = 5432
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.on-promise_app_sg.id]
  }

  # OUTBOUND
  egress {
    description = "Access to the internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # BOTH TCP and UDP PROTOCOL
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "on-promise-db-sg"
  }
}