
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"
  cluster_name    = "Develeap-eks-1"
  cluster_version = "1.31"  # Ensure this version is available
  bootstrap_self_managed_addons = true
  cluster_upgrade_policy = {
    support_type = "STANDARD"
  }
  cluster_addons = {
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  # Optional: Cluster endpoint configuration (Private access for better security)
  cluster_endpoint_public_access = true  # For enhanced security, disable public access
  cluster_endpoint_private_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true
  
  # Enable IRSA for IAM roles for service accounts
  enable_irsa = true

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.private_subnets
  
  tags = {
    Environment = "dev"
    Terraform   = "true"
    # Optionally add more tags for cost tracking and organization
  }
}
