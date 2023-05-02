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