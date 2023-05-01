#BLOCK TO CREATE EC2
resource "aws_instance" "web" {
  ami                     = "data.aws_ami.my_ami.image_id"
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [var.sg]

  tags = {
    Name        = "terraform instance_server_name"
  }
}


variable "sg" {}

#BLOCK TO PRINT THE ATTRIBUTES
output "private_dns" {
    value       =   aws_instance.web.private_dns
}
