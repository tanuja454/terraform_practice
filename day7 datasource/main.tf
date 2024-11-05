provider "aws" {
  
} 
data "aws_subnet" "test" {
  id = "subnet-0555d0ca1674877c7"
}





resource "aws_instance" "ec2" {
    ami = "ami-0cf4e1fcfd8494d5b"
    instance_type = "t2.micro"
    key_name = "ammu"
    subnet_id = data.aws_subnet.test.id
}