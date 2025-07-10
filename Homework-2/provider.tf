terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

resource "aws_key_pair" "bastion-key" {
  key_name   = "bastion-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCZ9hs7Q5PvvpTNMNnq4aghQMlf2OmNKHv+foFz+9DAb3w51dY8atoKfvf6zxjiWnoULJ+DyT+ZWncGid/+d62CLyLsXK7iZXGLQo33bu3aNW3D9K2ewUbwuxzYDkzGB90JcsKuIJXHcLj+seayVTvxsZyiltKaP/zZUSu2d0XaWtCaE0ZCjth/B1gOKQRFyWy850RnURXPlsIh3QAwRz4qSc0VE4S8Uc9W+faWk12Lb7eeKZPANc/Rzw11L8bZyexVGoOG863qUzJnBXsEJND4N6hRS20VyTv0BKQKtNatIlLHXh1GSOupx2j29Uxdp2uRcPGeqIzj0teT1toVthXEF2+sGywLrvxyYkSgcdTtQEVgCvjsjr9pNPpeQuKZEjWQtT+VAX9P4Qnk+l533LDgh3fnUX3QfLtT/HnUQOt3gHtYpJxxP79e73tiWZub6b1DsClhCPjBgyXxC8n5Q4Jbc77/Ul0n/b3sDLV/E7076vvB2Ypnm+AhU0rekpuuRgM= ec2-user@ip-172-31-23-112.ca-central-1.compute.internal"
}