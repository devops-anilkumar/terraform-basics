#ALWAYS STARTS WITH DECLEARING PROVIDER INFORMATION 

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-01a4c5cf14f30168e"
  instance_type = "t3.micro"

  tags = {
    Name = "terraform instance"
  }
}