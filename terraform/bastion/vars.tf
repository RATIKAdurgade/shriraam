variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "vpc_id" {
  default     = "vpc-05d12259ad7be4da1"
  description = "AWS VPC ID"
}

variable "bastion_ami" {  
  default = "ami-0be2609ba883822ec"
}

variable "availability_zone" {  
  default = "us-east-1b"
}

variable "bastion_inbound_cidr_block" {
  default     = ["67.164.73.109/32"]
  type        = list
  description = "My home Pub IP"
}

variable "eks_worker_group_sg_id" {
  default     = "sg-08835c1868cbd2a83"
  description = "EKS Worker nodes id"
}
