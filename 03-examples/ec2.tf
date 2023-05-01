#ALWAYS STARTS WITH DECLEARING PROVIDER INFORMATION 

provider "aws" {
    region      = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-01a4c5cf14f30168e"
  instance_type = "t2.micro"

  tags = {
    Name        = "terraform instance_server_name"
  }
}

#BLOCK TO PRINT THE ATTRIBUTE
output "private_dns_of_server" {
    value       = aws_instance.web.private_dns
}

#CREATES SECURITY GROUP
resource "aws_security_group" "allow_ssh_sg" {
  name        = "b53_allow_ssh-sg"
  description = "Allow ssh inbound traffic"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}