# ------------------------------
# EKS Cluster
# ------------------------------
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "flask-eks-cluster"
  cluster_version = "1.32"
  bootstrap_self_managed_addons = true
  cluster_upgrade_policy = {
    support_type = "STANDARD"
  }
  subnet_ids      = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id

  eks_managed_node_groups = {
    default = {
      desired_size = 2
      max_size     = 4
      min_size     = 1
      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"
    }
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

  tags = {
    Created = "by VI terraform"
    Environment = "dev"
    Project = "2bcloud" 
  }
}

