resource "aws_instance" "db_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.backend.name]
    iam_instance_profile = aws_iam_instance_profile.s3_instance_profile.name

  tags = {
    Name = "db-postgress-01"
    env  = "test"
  }
  key_name = aws_key_pair.deployer.key_name

}

resource "aws_instance" "app_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.frontend.name]
    iam_instance_profile = aws_iam_instance_profile.s3_instance_profile.name
  key_name = aws_key_pair.deployer.key_name
  tags = {
    Name = "app-01"
    env  = "test"
  }
}
