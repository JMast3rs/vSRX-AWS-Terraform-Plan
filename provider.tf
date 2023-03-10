
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "~> 3.5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
