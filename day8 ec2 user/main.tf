resource "aws_instance" "tanuja" {
    ami = "ami-0cf4e1fcfd8494d5b"
    instance_type = "t2.micro"
    key_name = "ammu"
    user_data = file("test.sh")

    
    
  
  tags = {
    Name = "mahesh"
  }
}