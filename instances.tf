resource "aws_instance" "vsrx_instance" {
  ami           = var.aws_vsrx_ami
  instance_type = var.aws_instance_type
  key_name      = var.aws_ssh_key

  network_interface {
    network_interface_id = aws_network_interface.public_mgmt_network_interface.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.public_untrust_network_interface.id
    device_index         = 1
  }

  network_interface {
    network_interface_id = aws_network_interface.public_trust_network_interface.id
    device_index         = 2
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}