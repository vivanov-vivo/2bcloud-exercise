provider "aws" {
  region = "eu-north-1"
  
}
terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = ">=2.11.0"  # Use the latest version available
    }
  }
  backend "s3" {
    bucket  = "2bcloud-terraform-states"
    key     = "eks/tfstates3.tfstate"
    region  = "eu-north-1"
    dynamodb_table = "2bcloud-terraform-locks"
    }
}
