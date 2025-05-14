output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_kubeconfig" {
  value = module.eks.kubeconfig
}

output "flask_service_url" {
  value = "http://${kubernetes_manifest.flask_service.manifest.status.loadBalancer.ingress[0].hostname}"
}
