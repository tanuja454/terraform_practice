provider "aws" {
  
}


#create vpc
resource "aws_vpc" "ammu" {
    cidr_block = "10.0.0.0/16"
    tags={
        Name="ammu"
    }
  
}

#create subnet
resource "aws_subnet" "ammu" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.ammu.id
    availability_zone = "us-west-1a"
    tags = {
      Name="pub-sub"
    }
  
}

#create internetgateway
resource "aws_internet_gateway" "ammu" {
  vpc_id = aws_vpc.ammu.id

  
  }
  

   

#create public routetable
resource "aws_route_table" "ammu" {
  vpc_id = aws_vpc.ammu.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ammu.id
  }
}



#subnet association
resource "aws_route_table_association" "ammu" {
  subnet_id      = aws_subnet.ammu.id
  route_table_id = aws_route_table.ammu.id
}

#security group
resource "aws_security_group" "ammu" {
  vpc_id = aws_vpc.ammu.id
  tags = {
      name="ammu_sg"
    }



  

ingress{
    description="TLS from vpc"
from_port=80
to_port=80
protocol="TCP"
cidr_blocks=["0.0.0.0/0"]

}
  

ingress{
    description="TLS from vpc"
    from_port=22
    to_port=22
    protocol="TCP"
    cidr_blocks=["0.0.0.0/0"]


}

egress {
from_port = 0
to_port=  0
protocol ="-1"
cidr_blocks=["0.0.0.0/0"]
}
}

#2ndsubnet
resource "aws_subnet" "babu" {
    availability_zone = "us-west-1c"
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.ammu.id
  
}
 #2ndroutetable
 resource "aws_route_table" "babu" {
    vpc_id = aws_vpc.ammu.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.ammu.id
    }
 }
 
 #NATGATE
 
    resource "aws_nat_gateway" "ammu" {
  connectivity_type = "public"
  subnet_id = aws_subnet.babu.id
  allocation_id = aws_eip.babu.id
  
}


#subnet associations 2
resource "aws_route_table_association" "babu" {
route_table_id = aws_route_table.babu.id 
subnet_id = aws_subnet.babu.id  
}

#elastic ip creating:

resource "aws_eip" "babu" {
  tags = {
    Name = "tanuja"
  }
}







#instances creation
#public instances

resource "aws_instance" "public" {
ami = "ami-0cf4e1fcfd8494d5b"
instance_type = "t2.micro"
key_name = "ammu"
security_groups = [aws_security_group.ammu.id]
associate_public_ip_address = true
subnet_id = aws_subnet.ammu.id
tags = {
  Name="pubec2"
}

}
#private instance
resource "aws_instance" "private" {
ami = "ami-0cf4e1fcfd8494d5b"
instance_type = "t2.micro"
key_name = "ammu"
security_groups = [aws_security_group.ammu.id]
associate_public_ip_address = false
subnet_id = aws_subnet.babu.id
tags = {
  Name="private"
}

}





  





