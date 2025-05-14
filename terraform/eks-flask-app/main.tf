# ------------------------------
# VPC + Networking
# ------------------------------

# ------------------------------
# EKS Cluster
# ------------------------------
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.28"
  subnet_ids      = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id

  eks_managed_node_groups = {
    default = {
      desired_size = 1
      max_size     = 1
      min_size     = 1
      instance_types = ["t3.small"]
    }
  }

  tags = {
    Created = "by VI terraform"
    Environment = "dev"
    Project = "2bcloud" 
  }
}

# ------------------------------
# Kubernetes Provider
# ------------------------------
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}

# ------------------------------
# Deploy Flask App
# ------------------------------
#resource "kubernetes_manifest" "flask_deployment" {
#  manifest = yamldecode(file("${path.module}/k8s/deployment.yaml"))
#}

#resource "kubernetes_manifest" "flask_service" {
#  manifest = yamldecode(file("${path.module}/k8s/service.yaml"))
#}
