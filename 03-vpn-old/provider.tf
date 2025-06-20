terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
  backend "s3" {
    bucket         = "roboshop-terraform-dev-remote-state"
    key            = "roboshop-terraform-vpn"
    region         = "us-east-1"
    dynamodb_table = "roboshop-terraform-dev-locking"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}