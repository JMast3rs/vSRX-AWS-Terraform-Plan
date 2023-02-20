
resource "aws_vpc" "vsrx_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vsrx_vpc"
  }
}

resource "aws_internet_gateway" "vsrx_vpc_internet_gateway" {
  vpc_id = aws_vpc.vsrx_vpc.id

  tags = {
    Name = "vsrx_vpc_internet_gateway"
  }
}

resource "aws_subnet" "public_mgmt_subnet" {
  vpc_id            = aws_vpc.vsrx_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.aws_availability_zone

  tags = {
    Name = "public_mgmt_subnet"
  }
}

resource "aws_subnet" "public_untrust_subnet" {
  vpc_id            = aws_vpc.vsrx_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.aws_availability_zone

  tags = {
    Name = "public_untrust_subnet"
  }
}

resource "aws_subnet" "public_trust_subnet" {
  vpc_id            = aws_vpc.vsrx_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = var.aws_availability_zone

  tags = {
    Name = "public_trust_subnet"
  }
}

resource "aws_route_table" "public_mgmt_route_table" {
  vpc_id = aws_vpc.vsrx_vpc.id

  tags = {
    Name = "public_mgmt_route_table"
  }
}

resource "aws_route" "public_mgmt_route_internet_gateway" {
  route_table_id         = aws_route_table.public_mgmt_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vsrx_vpc_internet_gateway.id
}

resource "aws_route_table" "public_untrust_route_table" {
  vpc_id = aws_vpc.vsrx_vpc.id

  tags = {
    Name = "public_untrust_route_table"
  }
}

resource "aws_route" "public_untrust_route_internet_gateway" {
  route_table_id         = aws_route_table.public_untrust_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vsrx_vpc_internet_gateway.id
}

resource "aws_route_table" "public_trust_route_table" {
  vpc_id = aws_vpc.vsrx_vpc.id

  tags = {
    Name = "public_trust_route_table"
  }
}

resource "aws_main_route_table_association" "vsrx_vpc_main_route_table" {
  vpc_id         = aws_vpc.vsrx_vpc.id
  route_table_id = aws_route_table.public_mgmt_route_table.id
}

resource "aws_route_table_association" "public_mgmt_route_table_association" {
  subnet_id      = aws_subnet.public_mgmt_subnet.id
  route_table_id = aws_route_table.public_mgmt_route_table.id
}

resource "aws_route_table_association" "public_untrust_route_table_association" {
  subnet_id      = aws_subnet.public_untrust_subnet.id
  route_table_id = aws_route_table.public_untrust_route_table.id
}

resource "aws_route_table_association" "public_trust_route_table_association" {
  subnet_id      = aws_subnet.public_trust_subnet.id
  route_table_id = aws_route_table.public_trust_route_table.id
}

resource "aws_route" "public_trust_route_vsrx_gateway" {
  route_table_id         = aws_route_table.public_trust_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id   = aws_network_interface.public_trust_network_interface.id
}
