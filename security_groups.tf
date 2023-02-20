
resource "aws_security_group" "allow_ssh_icmp_security_group" {
  name        = "allow_ssh_icmp_security_group"
  description = "Allow SSH/ICMP inbound traffic"
  vpc_id      = aws_vpc.vsrx_vpc.id

  ingress {
    description = "Allow SSH from any"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow ICMP from any"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_icmp_security_group"
  }
}

resource "aws_security_group" "allow_all_security_group" {
  name        = "allow_all_security_group"
  description = "Allow All inbound traffic"
  vpc_id      = aws_vpc.vsrx_vpc.id

  ingress {
    description = "Allow all from any"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all_security_group"
  }
}
