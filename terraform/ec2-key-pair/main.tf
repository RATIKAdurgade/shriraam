// Sends your public key to the instance
provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "demo-key-pair-shriram" {
    key_name = "demo-key-pair-shriram"
    public_key = file("/Users/begining/.ssh/demo-key-pair-shriram.pub")
}
