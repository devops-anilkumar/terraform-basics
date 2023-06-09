# terraform-basics

this repository contains all the basics needed to start learning and implementing github
.......

# how to install terraform?
https://developer.hashicorp.com/terraform/downloads

.........

###   POINTS TO REMEMBER IN TERRAFORM
......
     1.terraform is case sensitive
     2.there is no concept of single quotes and ussage of it is strictly prohibited
    3. by default terraform picks the file with the name terraform.tfvars any variable that's declared outside of terraform.tfvars needs to be explictly mentioned
    4. how to pass a shell variable in terraform : export TF_VARS_STATE=AP

    5. datasource in terraform helps us in querying the information that is already avaliable on provider and this eliminates the need  of hard coading the   values


 ### provisioners   
 provisioners in terraform helps us to acheive excuting tasks on local machine or on the remote machine

        1.  file provisioner        : to copy the file to the destionation machine
        2.   connection provisioner : this is to establish the connection to the remote machine with authentication
        3.  local provisioner       : this is to execute some task on the top of the machine where we run terraform
        4.  remote provisioner      : this is to execute some task on the top of the machine where we run terraform


### use case using provisioners :
  1. create ec2 instance along with a security group 
  2.  once ec2 is created i would like to run the ansible pull command and ansible playbook so my server will be operationally ready

  3. for second step to happend we also ensure first, connection provisioner has to be excuted , so that connection will be established and then we can run the remote -exec provisioner to run the ansible pull command.


note : provisioners by default are 'create-time' provisions , this means provisioners by default will only run during the creation of the resource ,, not all the time you run the 'terraform-apply'

      : there are also atype of provisioners called 'destroy-time ' provisioners which will only be excuted during the deletion of the resource

### first of the any project is 'network creation'

1. we need to design the network and then we will provision the infra
2. the design should include the size of the network and also future demands on mind 
3.network should be designed in such a way that only needed infra should be public facing rest of them should be 100% private
4. when i say private , none none of them should be acesseble directly from internet
in AWS vpc stand for virtual private cloud
surely we will design and provision our network

in aws each and every region will have a default network where all the infra is created in it,, but in reality every organisation creates their own network as per their needs 


### what is network peering?
by default , one network canot communicate with another network directly. in order to establish direct/private communication we need to perform peering between the networks

### public ip adresss vs private ip adresss

public ip is issued by isp  and is unique across the globe
private ip is unique only with in the infra net vs corporate network

#### network goals

 1. to create a network
 2. break the network into 2 peaces (sub network)
 3.one is public subnet (should have have public  ip and acesses to internet)
 4. other is prvate sub net (should not have public ip and no direct acess to internet)
 5. aslo WS should default network should be able to talk to public/private network ,using private ip
 6. machines in the public network should have acess to network anddddd from the internet
 7.  mahines in private network should not acess directly from the network
 8. if private server wants to talk to internet, is should be do able.(using NAT gatway it can be achievable)


   network CIDR :  10.0.0.0/24
   public subnet cidr :  10.0.0.0/25
   private subnet cidr : 10.0.0.128/25

### points to remember

if a machine is not having a public ip then ,you cannot acess from external or public network
ROUTER is a device which helps you in establishing connectivity between two different networks 
in AWS we call it as a IGW which is a software component and we can attach one IGW per VPC

## network peering

in order to achieve peering ensure that both VPC CIDR,s are unique ,if not peering will not work

###  install terrafile

..........
### HOW TO CREATE INFRA BY SUPPLYING THE BACKEND CONFIG FROM A SEPERATE FOLDER

.......
terrafile -f env-dev/Terrafile
terraform init -backend-config=env-dev/dev-backend.tfvars
terraform plan -var-file=env-dev/dev.tfvars
terraform apply -auto-approve -var-file=env-dev/dev.tfvars


### loop in terraform
when ever you excute some block of terraform code  n number of times you can use "count"
count is like a for loop which is going to excute the same block n number of times