terraform {
    backend "s3" {
        bucket = "aws-infra-setup-building-block"
        key    = "terraform/state/development.tfstate"
        region = "eu-central-1"
    }
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

