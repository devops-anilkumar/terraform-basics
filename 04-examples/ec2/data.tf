data "aws_ami" "my_ami" {
  most_recent      = true
  name_regex       = "Ami-with-Ansible-Installed"
  owners           = ["self"]
}