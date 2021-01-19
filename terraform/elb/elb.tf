provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "elb_sg" {
  name        = var.elb_name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "TCP from All"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["67.164.73.109/32"]
  }

  egress {
    from_port                = 0
    to_port                  = 0
    protocol                 = "-1"
    security_groups          = [var.eks_worker_group_sg_name]
  }

}

resource "aws_security_group_rule" "jenkins" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["67.164.73.109/32"]
  security_group_id = aws_security_group.elb_sg.id
}

resource "aws_elb" "elb" {
  name               = var.elb_name
  subnets            = var.subnets
  listener {
    instance_port     = 30080
    instance_protocol = "http"
    lb_port           = 443
    lb_protocol       = "https"
    ssl_certificate_id = "arn:aws:acm:us-east-1:415911685446:certificate/92ac54f6-11d0-4905-91d1-0120267a2e45"

  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:30080"
    interval            = 30
  }

  connection_draining         = true
  connection_draining_timeout = 400
  security_groups             = [aws_security_group.elb_sg.id]
}

resource "aws_elb" "jenkins-elb" {
  name               = var.jenkins_elb_name
  subnets            = var.subnets
  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 443
    lb_protocol       = "https"
    ssl_certificate_id = "arn:aws:acm:us-east-1:415911685446:certificate/92ac54f6-11d0-4905-91d1-0120267a2e45"

  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:8080"
    interval            = 30
  }

  connection_draining         = true
  connection_draining_timeout = 400
  security_groups             = [aws_security_group.elb_sg.id]
}

resource "aws_elb" "docker-elb" {
  name               = var.docker_elb_name
  subnets            = var.subnets
  listener {
    instance_port     = 8090
    instance_protocol = "http"
    lb_port           = 443
    lb_protocol       = "https"
    ssl_certificate_id = "arn:aws:acm:us-east-1:415911685446:certificate/92ac54f6-11d0-4905-91d1-0120267a2e45"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:8090"
    interval            = 30
  }

  connection_draining         = true
  connection_draining_timeout = 400
  security_groups             = [aws_security_group.elb_sg.id]
}
