
#ubuntu instance

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.bastion_key.key_name
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = file("apache2.sh")

  tags = {
    Name = "Ubuntu"
  }
}

#amazon instance

data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.8.20250707.0-kernel-6.1-x86_64"]
  }
  owners = ["137112412989"] # Canonical
}


resource "aws_instance" "web2" {
  ami                    = data.aws_ami.amazon.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.bastion_key.key_name
  subnet_id              = aws_subnet.public2.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = file("httpd.sh")

  tags = {
    Name = "Amazon"
  }
}

output "ec2" {
  value = [aws_instance.web.public_ip, aws_instance.web2.public_ip]
}