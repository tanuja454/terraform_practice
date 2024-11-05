terraform {
  backend "s3" {
    bucket = "vivooy20"
    key = "terraform.tfstate"
    region = "us-west-1"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt = true
    
  }
}
