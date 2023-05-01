#BLOCK TO CREATE EC2
resource "aws_instance" "web" {
  ami                     = "ami-01a4c5cf14f30168e"
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.allow_ssh_sg.id]

  tags = {
    Name        = "terraform instance_server_name"
  }
}

#BLOCK TO PRINT THE ATTRIBUTES
output "private_dns_of_server" {
    value       = aws_instance.web.private_dns
}

