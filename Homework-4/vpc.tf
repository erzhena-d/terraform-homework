resource "aws_vpc" "kaizen" {
  cidr_block           = var.vpc_config[0].cidr
  enable_dns_support   = var.vpc_config[0].enable_dns_support
  enable_dns_hostnames = var.vpc_config[0].enable_dns_hostnames

  tags = local.common_tags
}

resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = var.subnet_config[0].cidr
  availability_zone       = var.subnet_config[0].availability_zone
  map_public_ip_on_launch = var.subnet_config[0].auto_assign_public_ip


  tags = {
    Name = var.subnet_config[0].name
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = var.subnet_config[1].cidr
  availability_zone       = var.subnet_config[1].availability_zone
  map_public_ip_on_launch = var.subnet_config[1].auto_assign_public_ip

  tags = {
    Name = var.subnet_config[1].name
  }
}

resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = var.subnet_config[2].cidr
  availability_zone       = var.subnet_config[2].availability_zone
  map_public_ip_on_launch = var.subnet_config[2].auto_assign_public_ip

  tags = {
    Name = var.subnet_config[2].name
  }
}

resource "aws_subnet" "private2" {
  vpc_id                          = aws_vpc.kaizen.id
  cidr_block                      = var.subnet_config[3].cidr
  availability_zone               = var.subnet_config[3].availability_zone
  map_public_ip_on_launch = var.subnet_config[3].auto_assign_public_ip

  tags = {
    Name = var.subnet_config[3].name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kaizen.id
  tags = {
    Name = var.internet_gateway
  }
}
#create public route table, attach

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rt_names[0]
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_rt.id
}

#create private route table, attach (no need internet access, otherwise NAT)

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = var.rt_names[1]
  }
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private_rt.id
}

