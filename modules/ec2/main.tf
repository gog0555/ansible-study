resource "aws_instance" "pub_instance1a" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet1a_id
  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]
    key_name = "terraform-dev"
    root_block_device {
        volume_size = 8
        volume_type = "gp3"
        delete_on_termination = true
    }
  tags = {
    Name = "${var.env}-${var.name}-pub-instance1a"
  }
}

resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id
  name   = "${var.env}-${var.name}-sg"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.ec2_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ec2_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all" {
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
  security_group_id = aws_security_group.ec2_sg.id
}


resource "aws_instance" "pri_instance1a" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id = var.private_subnet1a_id
  vpc_security_group_ids = [
    aws_security_group.pri_ec2_sg.id
  ]
    key_name = "terraform-dev"
    root_block_device {
        volume_size = 8
        volume_type = "gp3"
        delete_on_termination = true
    }
  tags = {
    Name = "${var.env}-${var.name}-pri-instance1a"
  }
}

resource "aws_security_group" "pri_ec2_sg" {
  vpc_id = var.vpc_id
  name   = "${var.env}-${var.name}-private-sg"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_from_ec2_sg" {
  security_group_id = aws_security_group.pri_ec2_sg.id

  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_vpc_security_group_egress_rule" "allow_all_from_private" {
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
  security_group_id = aws_security_group.pri_ec2_sg.id
}
