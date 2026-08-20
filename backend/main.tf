provider "aws" {
  region = "us-east-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
}
resource "aws_s3_bucket" "my_bucket" {
    bucket = "backend-s3-capstone122"
}