resource "aws_instance" "postgres" {
  ami           = var.postgres_ami
  instance_type = var.postgres_instance_type
  subnet_id     = var.subnet_id

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-postgres-instance"
    }
  )
  vpc_security_group_ids = [aws_security_group.postgres_sg.id]
}

resource "aws_security_group" "postgres_sg" {
  name        = "postgres_sg"
  description = "Security group for PostgreSQL instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-postgres-sg"
    }
  )
}

