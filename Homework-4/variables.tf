variable "internet_gateway" {
  default = "my_igw"
  type    = string
}

variable "port" {
  default     = [22, 80, 443, 3306]
  type        = list(number)
  description = "Provide port"
}

variable "rt_names" {
  default     = ["public_rt, private_rt"]
  type        = list(string)
  description = "Provide route table type"
}

variable "ec2_web" {
  default = {
    ami_id = "ami-0ec1bf4a8f92e7bd1"
    type   = "t2.micro"
  }
  type = map(string)
}