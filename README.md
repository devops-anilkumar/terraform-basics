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