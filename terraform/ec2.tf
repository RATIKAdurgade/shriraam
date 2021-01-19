// Sends your public key to the instance
resource "aws_key_pair" "demo-key-pair-shriram" {
    key_name = "demo-key-pair-shriram"
    public_key = "file(var.PUBLIC_KEY_PATH)"
}

resource "aws_instance" "docker-xingnet-org" {
    ami = "lookup(var.AMI, var.AWS_REGION)"
    instance_type = "t2.large"
    # VPC
    subnet_id = "aws_subnet.demo-subnet-public-1.id"
    # Security Group
    vpc_security_group_ids = ["aws_security_group.ssh-allowed.id"]
    # the Public SSH key
    key_name = "aws_key_pair.demo-key-pair-shriram.id"
    connection {
        user = "var.EC2_USER"
        private_key = "file(var.PRIVATE_KEY_PATH)"
    }
    tags = {
      Name = "docker-xingnet-org"
    }
}
