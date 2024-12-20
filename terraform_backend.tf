terraform {
  backend "s3" {
    bucket = "rushwanth"
    region = "ap-south-1"
    key = "terrform.tfstate"
    encrypt = true
  }
}