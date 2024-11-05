resource "aws_instance" "local" {
    instance_type = ""
    ami = ""
    key_name = ""
    for_each = toset(var.test)
    tags = {
        Name = each.value
    }
  
}