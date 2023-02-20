
resource "aws_eip" "public_mgmt_elastic_ip" {
  network_interface         = aws_network_interface.public_mgmt_network_interface.id
  associate_with_private_ip = "10.0.1.254"
  vpc                       = true

  tags = {
    Name = "public_mgmt_elastic_ip"
  }
}

resource "aws_eip" "public_untrust_elastic_ip" {
  network_interface         = aws_network_interface.public_untrust_network_interface.id
  associate_with_private_ip = "10.0.2.254"
  vpc                       = true

  tags = {
    Name = "public_untrust_elastic_ip"
  }
}
