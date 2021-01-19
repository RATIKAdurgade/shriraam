
variable "elb_name" {
  description = "ELB name"
  type        = string
  default     = "spin-devops"
}

variable "jenkins_elb_name" {
  description = "ELB name"
  type        = string
  default     = "jenkins-spin-devops"
}

variable "docker_elb_name" {
  description = "ELB name"
  type        = string
  default     = "docker-spin-devops"
}

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "vpc_id" {
  default     = "vpc-05d12259ad7be4da1"
  description = "AWS VPC ID"
}

variable "eks_worker_group_sg_name" {
  default     = "sg-08835c1868cbd2a83"
  description = "EKS Worker nodes name"
}

variable "subnets" {
  default     = ["subnet-0a8a50ce8b77e2d4f", "subnet-098fbf6f343e741ad", "subnet-0c258cae9abdf7025"]
  type        = list
  description = "List of subnets"
}
