provider "aws" {
  region = var.region  
}

terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = ">=2.11.0"  # Use the latest version available
    }
  }
  backend "s3" {
    bucket  = "2bcloud-tf-states"
    key     = "flask-eks/terraform.tfstate"
    region  = "eu-north-1"
    dynamodb_table = "2bcloud-tf-locks"
    }
}
