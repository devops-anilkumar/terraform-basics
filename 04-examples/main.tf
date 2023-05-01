#DECLEARING A MODULE WITH THE NAME EC2
module "ec2" {
    source =  "./ec2"
    sg  =  module.sg.sg
}

#DECLEARING A MODULE WITH THE NAME SG
module "sg" {
    source =  "./sg"
}

