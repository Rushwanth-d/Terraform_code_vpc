provider "aws" {
  region = var.region
}
#Create Vpc and metion the cidr & tag the name.
resource "aws_vpc" "example" {
  cidr_block = var.cidr_block_value
  tags = {
    Name=var.vpc_Name
  }
}

#Create a Public Subnet wit name

resource "aws_subnet" "subnet_public" {
  vpc_id = aws_vpc.example.id
  cidr_block = var.subnet_public_cidr
  availability_zone = var.availability_zone
  tags = {
    Name= "Public_subnet"
  }
}

# Create a private subnetwith name

resource "aws_subnet" "subnet_private" {
  vpc_id = aws_vpc.example.id
  cidr_block = var.subnet_private_cidr
  availability_zone = var.availability_zone
  tags = {
    Name="private_subnet"
  }
}

#Create a Internet Gateway wit tag name & Attach the IG to the vpc.

resource "aws_internet_gateway" "IG-Gateway" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name= var.aws_internet_gateway_name
  }
}


#Create a route table for public subnet wit tag

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id
  route {
    cidr_block="0.0.0.0/0"
    gateway_id=aws_internet_gateway.IG-Gateway.id
  }
  tags = {
    name=var.aws_route_table_public_subnet
  }
}

#Create a route table for private subnet wit tag.

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.example.id
  route {
    cidr_block="0.0.0.0/0"
    gateway_id=aws_nat_gateway.Nat_gateway12.id
  }
  tags = {
    name=var.aws_route_table_private_subnet
  }
}

#Create route table association with public subnet.

resource "aws_route_table_association" "public" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.subnet_public.id

}

#Create route table association with private subnet

resource "aws_route_table_association" "private" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.subnet_private.id

}


# Allocate an Elastic IP for the NAT Gateway
resource "aws_eip" "nat_ip" {
  vpc = true
}

# Create the NAT Gateway and associate it with the Elastic IP
resource "aws_nat_gateway" "Nat_gateway12" {
  subnet_id     = aws_subnet.subnet_private.id
  allocation_id = aws_eip.nat_ip.id  # Attach the Elastic IP here

  tags = {
    Name=var.aws_nat_gateway_name
  }
}
