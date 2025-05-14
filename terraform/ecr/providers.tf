provider "aws" {
  region = var.region  
}

terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = ">=2.11.0"  # Use the latest version available
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket  = "2bcloud-tf-states"
    key     = "ecr/terraform.tfstate"
    region  = "eu-north-1"
    dynamodb_table = "2bcloud-tf-locks"
    }
}
