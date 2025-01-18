#CREATE A VPC
resource "aws_vpc" "myVPC" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  tags = merge({
      Name = "${var.env}-VPC"
  }, local.common_tags)
}


#CREATE PUBLIC SUBNETS
resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidr)
  vpc_id = aws_vpc.myVPC.id
  cidr_block = var.public_subnets_cidr[count.index]
  availability_zone = var.azs_for_public_subnets[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index+1}",
    env = var.env
  }
}

#CREATE PRIVATE SUBNETS
resource "aws_subnet" "private" {
  count = length(var.private_subnets_cidr)
  vpc_id = aws_vpc.myVPC.id
  cidr_block = var.private_subnets_cidr[count.index]
  availability_zone = var.azs_for_public_subnets[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet-${count.index+1}",
    env = var.env
  }
}

#CREATE AN INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myVPC.id
  tags = {
    Name = "${var.env}-igw"
  }
}


#CREATE PUBLIC ROUTE TABLE
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.myVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt-${var.env}"
  }
}

#ASSOCIATE PUBLIC SUBNETS WITH PUBLIC ROUTE TABLE
resource "aws_route_table_association" "public" {
  count = length(var.public_subnets_cidr)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public-rt.id
}

#CREATE AN ELASTIC IP
resource "aws_eip" "first_eip" {
  domain = "vpc"
  depends_on = [aws_internet_gateway.igw] 
}

#CREATE A NAT GATEWAY
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.first_eip.id
  subnet_id = aws_subnet.public[0].id
  depends_on = [aws_internet_gateway.igw] 
  tags = {
    Name = "ngw-${var.env}"
  }
  
}
#CREATE PRIVATE ROUTE TABLE
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.myVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }
  tags = {
    Name = "private-rt-${var.env}"
  }
}

#ASSOCIATE PRIVATE SUBNETS WITH PRIVATE ROUTE TABLE
resource "aws_route_table_association" "private" {
  count = length(var.private_subnets_cidr)
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private-rt.id

}

#CREATE GROUP OF PRIVATE SUBNETS FOR DB
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "My DB subnet group"
  }
}