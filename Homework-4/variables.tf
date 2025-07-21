variable "internet_gateway" {
  type        = string
  description = "igw name"
}

variable "port" {
  type        = list(number)
  description = "Provide port"
}

variable "rt_names" {
  type        = list(string)
  description = "Provide route table type"
}

variable "ec2_web" {
  type        = map(string)
  description = "AMI id and instance type"
}

variable "vpc_config" {
  description = "vpc configurations"
  type = list(object({
    cidr                 = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
  }))
}

variable "subnet_config" {
  description = "subnets configurations"
  type = list(object({
    name                  = string
    cidr                  = string
    availability_zone     = string
    auto_assign_public_ip = bool
  }))
}