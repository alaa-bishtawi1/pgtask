resource "aws_security_group" "backend" {
  name        = "backend"
  description = "Backend security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
        cidr_blocks = ["${var.my_public_ip}/32"]
        

  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
  security_groups = [aws_security_group.frontend.id]


  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "frontend" {
  name        = "frontend"
  description = "Frontend security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_public_ip}/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
