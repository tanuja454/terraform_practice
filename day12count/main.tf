provider "aws" {
    region = "us-west-1"
  
}




resource "aws_instance" "ec2" {
    ami = "ami-0cf4e1fcfd8494d5b"
    instance_type = "t2.micro"
    key_name = "ammu"
    count = length("var.Name")
     tags = {
            Name =var.test[count.index]
     }
     
    
  
}
  variable "test" {
    type = list(string)
    default = [ "tanuja","gopi","phillip" ]
    
  }
  