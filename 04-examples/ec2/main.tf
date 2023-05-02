#BLOCK TO CREATE EC2
resource "aws_instance" "web" {
  ami                     =  data.aws_ami.my_ami.image_id
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [var.sg]

  tags = {
    Name        = "terraform instance_server_name"
  }
#DECLEARING THE REMOTE PROVISIONER INSIDE THE RESOURCE 
    provisioner "remote-exec" {
    
    connection {              //establishes connectivity to the created machine
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.public_ip
  }
    inline = [
     // "ansible-pull -U https://github.com/devops-anilkumar/ansible.git robot-pull.yml -e ENV=dev -e COMPONENT=mongodb"
     "ansible-pull -U https://github.com/b53-clouddevops/ansible.git robot-pull.yml -e ENV=dev -e COMPONENT=mongodb"
     
    ]
  }
}
}


variable "sg" {}

#BLOCK TO PRINT THE ATTRIBUTES
output "private_dns" {
    value       =   aws_instance.web.private_dns
}
