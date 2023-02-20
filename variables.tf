#########################################################################
#-----------------------------variables---------------------------------#
#########################################################################

# AWS region where the vSRX will be deployed.
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

# AWS availability zone where the vSRX will be deployed. This must be in the same region as above.
variable "aws_availability_zone" {
  type    = string
  default = "us-east-1a"
}

# The name of a pre-generated SSH key on the AWS Console.
variable "aws_ssh_key" {
  type    = string
  default = "vsrx-aws-ha-project"
}

# vSRX AMI id.
variable "aws_vsrx_ami" {
  type    = string
  default = "ami-0ba20c4670810454c"
}

# vSRX instance type.
variable "aws_instance_type" {
  type    = string
  default = "c5.large"
}

#########################################################################
#---------------------------end-variables-------------------------------#
#########################################################################
