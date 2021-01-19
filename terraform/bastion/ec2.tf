provider "aws" {
  region = "us-east-1"
}
#
# Bastion resources
#
resource "aws_security_group" "bastion" {
  vpc_id = var.vpc_id

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_network_interface_sg_attachment" "bastion" {
  security_group_id    = aws_security_group.bastion.id
  network_interface_id = aws_instance.bastion.primary_network_interface_id
}

resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami
  availability_zone           = var.availability_zone
  instance_type               = "t3.micro"
  key_name                    = "demo-key-pair-shriram"
  subnet_id                   = "subnet-0a8a50ce8b77e2d4f"
  associate_public_ip_address = true
}

resource "aws_security_group_rule" "ssh_ingress" {
  count = length(var.bastion_inbound_cidr_block) 

  security_group_id = aws_security_group.bastion.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.bastion_inbound_cidr_block[count.index]]
}

resource "aws_security_group_rule" "eks-ingress" {

  security_group_id        = aws_security_group.bastion.id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = var.eks_worker_group_sg_id
}
