provider aws {
    region = "us-west-1"
    }
    
    resource "aws_instance" "example" {
    ami = "ami-0cf4e1fcfd8494d5b"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "example" {
  bucket ="hppppppp"
   depends_on = [aws_instance.example]
}
