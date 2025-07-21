resource "aws_instance" "web" {
  ami           = var.ec2_web["ami_id"]
  instance_type = var.ec2_web["type"]
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = aws_key_pair.bastion_key.key_name 
  
  tags          = local.common_tags
}

