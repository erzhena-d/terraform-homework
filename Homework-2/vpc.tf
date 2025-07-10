
# data "aws_subnets" "all" {
#   filter {
#     name   = "vpc-id"
#     values = [var.vpc_id]
#   }

  
# }

# resource "aws_instance" "app" {
#   for_each      = toset(data.aws_subnets.all.ids)
#   ami           = var.ami
#   instance_type = "t2.micro"
#   subnet_id     = each.value
# }