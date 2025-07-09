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
  region = "us-east-1"
}

# Create users Blackpink
resource "aws_iam_user" "jenny" {
  name = "jenny"
  }

resource "aws_iam_user" "rose" {
  name = "rose"
  }

resource "aws_iam_user" "lisa" {
  name = "lisa"
  }

resource "aws_iam_user" "jisoo" {
  name = "jisoo"
  }

# Create users Twice
resource "aws_iam_user" "jihyo" {
  name = "jihyo"
  }

resource "aws_iam_user" "sana" {
  name = "sana"
  }

resource "aws_iam_user" "momo" {
  name = "momo"
  }

resource "aws_iam_user" "dahyun" {
  name = "dahyun"
  }



# Creating groups for Blackpink and Twice
resource "aws_iam_group" "blackpink" {
    name = "blackpink"
}

resource "aws_iam_group" "twice" {
    name = "twice"
}

# Adding users to Blackpink group
  resource "aws_iam_group_membership" "blackpink_members" {
  name = "blackpink"
  
  users = [
    aws_iam_user.jenny.name,
    aws_iam_user.rose.name,
    aws_iam_user.lisa.name,
    aws_iam_user.jisoo.name,
    aws_iam_user.miyeon.name
    ]

  group = aws_iam_group.blackpink.name
  }

# Adding users to Twice group
resource "aws_iam_group_membership" "twice_members" {
  name = "twice"
  
  users = [
    aws_iam_user.jihyo.name,
    aws_iam_user.sana.name,
    aws_iam_user.momo.name,
    aws_iam_user.dahyun.name,
    aws_iam_user.mina.name
    ]

  group = aws_iam_group.twice.name
  }
  

# terraform import aws_iam_user.miyeon miyeon
# terraform import aws_iam_user.mina mina
resource "aws_iam_user" "miyeon" {
  name = "miyeon"
}

resource "aws_iam_user" "mina" {
  name = "mina"
}