terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "lcube-tfstate-bucket"
    key            = "global/terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "lcube-tfstate-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-west-3"
  alias = "sandbox"

  assume_role {
    role_arn = "arn:aws:iam::966616891605:role/Devops"
  }
}

provider "aws" {
  region = "eu-west-3"

  assume_role {
    role_arn = "arn:aws:iam::966616891605:role/Devops"
  }
}

resource "aws_s3_bucket" "implicit" {
  bucket = "lcube-tf-example-terraform-bucket-implicit-target"
}