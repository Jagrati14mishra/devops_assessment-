terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.82.2"
        }
    }
}

provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}

resource "aws_vpc" "vpc1" {
  cidr_block = "20.0.0.0/16"
}