resource "aws_instance" "dependent" {
    ami = "ami-0cf4e1fcfd8494d5b"
    instance_type = "t2.micro"
    key_name = "ammu"

    iam_instance_profile = aws_iam_role.admin_access_role.name

    tags = {
      name="pub"
    }
    
    }

    # Create the IAM Role
resource "aws_iam_role" "admin_access_role" {
  name = "AdminAccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"  # Change this based on who will assume the role
      }
      Effect    = "Allow"
      Sid       = ""
    }]
  })
}

# Define IAM Policy for Full Administrative Access
resource "aws_iam_policy" "full_admin_access_policy" {
  name        = "FullAdminAccessPolicy"
  description = "Policy for full administrative access to target resources"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "*"
      Resource = "*"
    }]
  })
}

# Attach the IAM Policy to the Role
resource "aws_iam_role_policy_attachment" "full_admin_access_attachment" {
  role       = aws_iam_role.admin_access_role.name
  policy_arn = aws_iam_policy.full_admin_access_policy.arn
}


    

    


  
  
