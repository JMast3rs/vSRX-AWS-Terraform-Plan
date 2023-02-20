
resource "aws_network_interface" "public_mgmt_network_interface" {
  subnet_id         = aws_subnet.public_mgmt_subnet.id
  private_ips       = ["10.0.1.254"]
  security_groups   = [aws_security_group.allow_ssh_icmp_security_group.id]
  source_dest_check = false

  tags = {
    Name = "public_mgmt_network_interface"
  }
}

resource "aws_network_interface" "public_untrust_network_interface" {
  subnet_id         = aws_subnet.public_untrust_subnet.id
  private_ips       = ["10.0.2.254"]
  security_groups   = [aws_security_group.allow_ssh_icmp_security_group.id]
  source_dest_check = false

  tags = {
    Name = "public_untrust_network_interface"
  }
}

resource "aws_network_interface" "public_trust_network_interface" {
  subnet_id         = aws_subnet.public_trust_subnet.id
  private_ips       = ["10.0.3.254"]
  security_groups   = [aws_security_group.allow_all_security_group.id]
  source_dest_check = false

  tags = {
    Name = "public_trust_network_interface"
  }
}
