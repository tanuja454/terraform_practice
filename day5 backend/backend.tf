
terraform {
  backend "s3" {
    bucket = "ammuuuu"
    key = "terraform.tfstate"
    region = "us-west-1"
    
  }
}
