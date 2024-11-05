module "tanuja" {
    source ="../day2 Basic  code"
    ami_id = var.ami_id
    key_name = var.key_name
    instance_type = var.instance_type
  
}