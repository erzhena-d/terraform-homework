# terraform-homework
```hcl
port             = [22, 80, 443, 3306]
internet_gateway = "my-igw"
rt_names         = ["public_rt", "private_rt"]
ec2_web = {
  ami_id = "ami-0be5f59fbc80d980c"
  type   = "t2.micro"
}

vpc_config = [{ cidr = "10.0.0.0/16", enable_dns_hostnames = true, enable_dns_support = true }]

subnet_config = [
  { cidr = "10.0.1.0/24", name = "public1", availability_zone = "us-west-2a", auto_assign_public_ip = true },
  { cidr = "10.0.2.0/24", name = "public2", availability_zone = "us-west-2b", auto_assign_public_ip = true },
  { cidr = "10.0.3.0/24", name = "private1", availability_zone = "us-west-2c", auto_assign_public_ip = false },
  { cidr = "10.0.4.0/24", name = "private2", availability_zone = "us-west-2d", auto_assign_public_ip = false }
]
