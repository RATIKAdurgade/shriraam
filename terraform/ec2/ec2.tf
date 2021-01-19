variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

provider "aws" {
  region = "us-east-1"
}

# // Sends your public key to the instance
# resource "aws_key_pair" "demo-key-pair-shriram" {
#     key_name = "demo-key-pair-shriram"
#     public_key = file("/Users/begining/.ssh/demo-key-pair-shriram.pub")
# }

resource "aws_instance" "logs-xingnet-org" {
    ami = var.AMI
    instance_type = "t2.large"
    # VPC
    subnet_id = "subnet-0378efaf8b490e219"
    # Security Group
    vpc_security_group_ids = ["sg-08835c1868cbd2a83"]
    # the Public SSH key
    key_name = "demo-key-pair-shriram"
    tags = {
      Name = "logs-xingnet-org"
    }
}

resource "aws_instance" "monitor-xingnet-org" {
    ami = var.AMI
    instance_type = "t2.large"
    # VPC
    subnet_id = "subnet-0378efaf8b490e219"
    # Security Group
    vpc_security_group_ids = ["sg-08835c1868cbd2a83"]
    # the Public SSH key
    key_name = "demo-key-pair-shriram"
    tags = {
      Name = "monitor-xingnet-org"
    }
}


# resource "aws_instance" "router-xingnet-org" {
#     ami = "ami-0b6ac039c8a898cb2"
#     instance_type = "t2.xlarge"
#     # VPC
#     subnet_id = "subnet-0378efaf8b490e219"
#     # Security Group
#     vpc_security_group_ids = ["sg-08835c1868cbd2a83"]
#     # the Public SSH key
#     key_name = "demo-key-pair-shriram"
#     tags = {
#       Name = "router-xingnet-org"
#     }
# }

resource "aws_instance" "jenkins-xingnet-org" {
    ami = var.AMI
    instance_type = "t2.large"
    # VPC
    subnet_id = "subnet-0378efaf8b490e219"
    # Security Group
    vpc_security_group_ids = ["sg-08835c1868cbd2a83"]
    # the Public SSH key
    key_name = "demo-key-pair-shriram"
    tags = {
      Name = "jenkins-xingnet-org"
    }
}

resource "aws_instance" "mysql-xingnet-org" {
    ami = var.AMI
    instance_type = "t2.large"
    # VPC
    subnet_id = "subnet-0378efaf8b490e219"
    # Security Group
    vpc_security_group_ids = ["sg-08835c1868cbd2a83"]
    # the Public SSH key
    key_name = "demo-key-pair-shriram"
    tags = {
      Name = "mysql-xingnet-org"
    }
}

# resource "aws_instance" "docker-xingnet-org" {
#     ami = var.AMI
#     instance_type = "t2.large"
#     # VPC
#     subnet_id = "subnet-0378efaf8b490e219"
#     # Security Group
#     vpc_security_group_ids = ["sg-08835c1868cbd2a83"]
#     # the Public SSH key
#     key_name = "demo-key-pair-shriram"
#     tags = {
#       Name = "docker-xingnet-org"
#     }
# }