resource "aws_instance" "web_app" {
  ami                         = var.web_app_ami
  instance_type               = var.web_app_instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.web_app_sg.id]
  key_name                    = aws_key_pair.key_pair.key_name
  associate_public_ip_address = true
  user_data                   = <<-EOF
              #!/bin/bash
              # Commands to install and configure your web application
              EOF

  tags = merge(
    {
      Name = "${var.environment}-WebAppInstance"
    },
    var.tags
  )

}

// Create SSH key pair for EC2 instance
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = "${var.environment}-KeyPair"
  public_key = tls_private_key.ssh_key.public_key_openssh
  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-KeyPair"
    }
  )
}

resource "aws_security_group" "web_app_sg" {
  name        = "web_app_sg"
  description = "Security group for web application"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_allowed_cidr_blocks # Pass this variable from the module call
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
      Name = "${var.environment}-WebAppSG"
    }
  )
}


