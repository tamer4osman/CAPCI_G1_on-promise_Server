resource "aws_instance" "on-promise_app_server" {
  ami                    = data.aws_ami.amz_linux_image.id
  instance_type          = var.on-promise_app_ec2_type
  subnet_id              = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.on-promise_app_sg.id]
  key_name               = var.keypair_name
  user_data              = templatefile("${path.module}/user-data.sh.tpl",
                            {
                              db_endpoint = aws_db_instance.on-promise_db.address,
                              db_password = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.on-promise_db_pw.secret_string))["movie_db_password"]
                            })

  tags = {
    Name = "on-promise-mgmt-server"
  }
}