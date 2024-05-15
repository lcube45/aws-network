terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
  alias = "sandbox"

  assume_role {
    role_arn = "arn:aws:iam::966616891605:role/Devops"
  }
}

resource "aws_s3_bucket" "demo" {
  provider = aws.sandbox
  bucket = "lcube-tf-example-terraform-bucket-explicit-target"
}