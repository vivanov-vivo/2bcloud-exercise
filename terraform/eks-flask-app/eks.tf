# ------------------------------
# EKS Cluster
# ------------------------------
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"
  cluster_name    = "flask-eks-cluster"
  cluster_version = "1.32"
  create_iam_role = false
  access_entries = {
    # One access entry with a policy associated
    example = {
      principal_arn = "arn:aws:iam::633154839293:role/flask-eks-cluster-role"

      policy_associations = {
        example = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
          access_scope = {
            namespaces = ["default"]
            type       = "namespace"
          }
        }
      }
    }
  }
  #cluster_iam_role_arn = "arn:aws:iam::633154839293:role/devops-cluster-role"
 
  cluster_upgrade_policy = {
    support_type = "STANDARD"
  }
  subnet_ids      = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id

  eks_managed_node_groups = {
    default = {
      create_iam_role      = false
      iam_role_arn         = "arn:aws:iam::633154839293:role/devops-node-role"
      instance_types       = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }
  cluster_addons = {
    coredns = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }
  #enable_cluster_log_types = []
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

