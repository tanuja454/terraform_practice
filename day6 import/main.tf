resource "aws_instance" "import" {
  ami = "ami-0cf4e1fcfd8494d5b"  # Replace with your AMI ID
  instance_type = "t2.micro"      # Replace with your instance type

  # Other optional arguments can go here
  key_name = "ammu"
    tags = {
      Name = "dev"
}
}


