resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block

  instance_tenancy = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-${var.name}-vpc"
  }
}

resource "aws_subnet" "public1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"
  map_public_ip_on_launch  = true

  tags = {
    Name = "${var.env}-${var.name}-public-subnet-1a"
  }
}

resource "aws_subnet" "private1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-1a"
  map_public_ip_on_launch  = false

  tags = {
    Name = "${var.env}-${var.name}-private-subnet-1a"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-${var.name}-igw"
  }
}


resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env}-${var.name}-public-rtb"
  }
}

resource "aws_route_table_association" "rtb_subnet" {
  subnet_id      = aws_subnet.public1a.id
  route_table_id = aws_route_table.public_rtb.id
}
