#DECLEARING PROVIDER INFORMATION
#ALWAYS STARTS WITH DECLEARING PROVIDER INFORMATION 

provider "aws" {
    region      = "us-east-1"
}

#DECLEARING THE REMOTE BACKEND, THIS WILL KEEP THE STATE FILES IN A REMOTE S3 BUCKETS AND THIS WILL LET TEAM COLOBORATE
terraform {
  backend "s3" {
    bucket = "state-terraformbucket"
    key    = "modules/terraform.tfstate"
    region = "us-east-1"
  }
}