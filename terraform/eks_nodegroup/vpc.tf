module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "Develeap-eks-1-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway = true
  single_nat_gateway  = true  # Change to false for multiple NAT Gateways if HA is needed
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_vpn_gateway = false  # Set to false if you don't plan on using a VPN connection

  one_nat_gateway_per_az = false  # Set to true for HA (one NAT Gateway per AZ)

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "true"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "true"
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
    # Add more tags as necessary (e.g., Owner, Project, etc.)
  }
}
