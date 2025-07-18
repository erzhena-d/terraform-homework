resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.kaizen.id
  tags = {
    Name = "homework3_igw"
  }
}

#create public route table, attach

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public_rt"
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
    Name = "private_rt"
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

