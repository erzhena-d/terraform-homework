
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "available" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

locals {
  subnets = slice(data.aws_subnets.available.ids, 0, 3)
}


resource "aws_instance" "web" {
  count         = 3
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t3.micro"
  subnet_id     = local.subnets[count.index]
  key_name      = aws_key_pair.bastion-key.key_name
  security_groups = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-${count.index + 1}"
  }
}

# locals {
#   subnets = slice(data.aws_subnets.available.ids, 0, 3)
# }

