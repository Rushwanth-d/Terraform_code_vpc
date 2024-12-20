variable "region" {
  description = "aws region where we need to create"
  type = string
}

variable "cidr_block_value" {
  description = "aws cidr value"
  type = string

}
variable "subnet_public_cidr" {
  description = "pulic cidr value"
  type = string

}
variable "subnet_private_cidr" {
  description = "public cider value"
  type = string

}

variable "availability_zone" {
  description = "we need mention availability_zone "
  type = string


}
variable "vpc_Name" {
  description = "name of the vpc"
  type = string

}

variable "aws_internet_gateway_name" {
  description = "name of the internet gateway"
  type = string
}
variable "aws_route_table_public_subnet" {
  description = "aws_route_table_public_subnet"
  type= string
}
variable "aws_route_table_private_subnet" {
  description = "aws_route_table_public_subnet"
  type= string
}

variable "aws_nat_gateway_name" {
  description = "enter name nat gateway"
  type=string
}


