terraform {
  backend "s3" {
    bucket = "RushwanthS3"
    region = "ap-south-1"
    key = "/terrform.tfstate"
    encrypt = true
  }
}