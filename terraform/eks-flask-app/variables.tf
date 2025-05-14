variable "region" {
  default = "eu-north-1"
}

variable "cluster_name" {
  default = "flask-eks-cluster"
}

#variable "image_url" {
#  description = "Docker image URL in ECR (e.g. <account>.dkr.ecr.<region>.amazonaws.com/hello-flask-app:latest)"
#  type        = string
#}
