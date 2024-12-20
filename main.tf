module "vpc" {
  source = "./modules"

  region              = "ap-south-1"
  cidr_block_value    = "10.0.0.0/16"
  vpc_Name            = "my_vpc"
  subnet_private_cidr = "10.0.2.0/24"
  subnet_public_cidr  = "10.0.1.0/24"
  availability_zone   = "ap-south-1a"
  aws_internet_gateway_name= "IG-GATE"
  aws_route_table_public_subnet="public_route_table"
  aws_route_table_private_subnet="private_route_table"
  aws_nat_gateway_name="john_gateway"
}