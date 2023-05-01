#DECLEARING THE REMOTE BACKEND, THIS WILL KEEP THE STATE FILES IN A REMOTE S3 BUCKETS AND THIS WILL LET TEAM COLOBORATE
terraform {
  backend "s3" {
    bucket = "state-terraformbucket"
    key    = "dev/ec2"
    region = "us-east-1"
  }
}
