//removing the plugin atthe time of cluster ceration because it need node to be created first
//resource "aws_eks_addon" "example" {
 // depends_on = [ module.eks_managed_node_group ]
 // cluster_name = module.eks.cluster_name
 // addon_name   = "coredns"
//}

module "eks_managed_node_group" {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  cluster_service_cidr = module.eks.cluster_service_cidr
  name            = "Develeap-eks-1-ng"
  cluster_name    = module.eks.cluster_name
  cluster_version = "1.31"  # Ensure this matches your EKS cluster version

  subnet_ids = module.vpc.private_subnets

  # Uncomment and provide security group IDs if needed
  # cluster_primary_security_group_id = module.eks.cluster_primary_security_group_id
  # vpc_security_group_ids            = [module.eks.node_security_group_id]

  min_size     = 1
  max_size     = 4  # You can adjust this as needed based on your workload
  desired_size = 2

  instance_types = ["t3.medium"]  # Optionally add more types for flexibility
  capacity_type  = "ON_DEMAND"  # Set to "SPOT" for cost savings if applicable

  tags = {
    Environment = "dev"
    Terraform   = "true"
    # Add more tags as necessary (e.g., Owner, Project, etc.)
  }
}
