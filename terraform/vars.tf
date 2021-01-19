variable "AWS_REGION" {    
  default = "us-east-1"
}

variable "PUBLIC_KEY_PATH" {
  default = "/Users/begining/.ssh/demo-key-pair-shriram.pub"
}

variable "AMI" {  
  default = {
    "us-east-1" = "ami-0dd0589ee7a07c236" #k8s 1.18 optimized amazon linux
  }
}

