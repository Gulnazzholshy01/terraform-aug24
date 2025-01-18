resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.web.id]
  instance_type          = var.instance_type
  tags = {
    Name = "my-server-${var.env}"
    Env = var.env
  }
}

resource "aws_security_group" "web" {
  name        = "MySG"
  description = "Session-3 SG"

  tags = {
    Name = "${var.security_group_name}-${var.env}"
    Env = var.env
  }
}


resource "aws_vpc_security_group_ingress_rule" "ssh_ingress" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "all_open" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}
