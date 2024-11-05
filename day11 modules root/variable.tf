variable "ami_id" {
    description = "passing AMI vlaue to  main.tf"
    type = string
    default = "ami-0cf4e1fcfd8494d5b"
  
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "key_name" {
    type = string
    default = "ammu"
  
}