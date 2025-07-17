
data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "web-1" {
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t2.micro"
  subnet_id     = "subnet-00b3b0fba4adece83"
  key_name      = aws_key_pair.bastion-key.key_name
  security_groups = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-1"
  }
}

resource "aws_instance" "web-2" {
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0f5fb1a78b738bfe0"
  key_name      = aws_key_pair.bastion-key.key_name
  security_groups = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-2"
  }
}

resource "aws_instance" "web-3" {
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t2.micro"
  subnet_id     = "subnet-031784cba0b9443bf"
  key_name      = aws_key_pair.bastion-key.key_name
  security_groups = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-3"
  }
}

output "ec2_global_ips" {
  value = [
    aws_instance.web-1.public_ip,
    aws_instance.web-2.public_ip,
    aws_instance.web-3.public_ip
  ]
}













# tags = {
#     Name = "web-${count.index + 1}"
#   }


# # locals {
#   subnets = slice(data.aws_subnets.available.ids, 0, 3)
# }

