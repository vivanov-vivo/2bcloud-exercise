# Project 2bcloud Exercise

## 📄 Overview

This repository contains infrastructure code, CI/CD pipeline configurations, Helm charts, and application code for deploying a Flask-based web application on EKS using Terraform.

### Project Structure

```pgsql
2bcloud-exercise-master
│   README.md
│
├── .github/
│   └── workflows/
│       ├── CD-2bcloud-flow.yml
│       ├── CI-2bcloud-flow.yml
│       ├── terraform-tf-state-s3.yml
│       ├── terraform-ecr.yml
│       └── terraform-eks-nodegroup.yml
│
├── aws/
│   ├── eks-cluster-trust-policy.json
│   ├── eks-nodegroup-trust-policy.json
│   ├── launch-template-access-policy.json
│   ├── node-role-trust-relationship.json
│   └── roles.txt
│
├── helm-charts/
│   └── hello-flask-app/
│       ├── Chart.yaml
│       ├── values.yaml
│       ├── values.yaml_with_ingress
│       └── templates/
│           ├── deployment.yaml
│           ├── ingress.yaml_notrun
│           └── service.yaml
│
├── terraform/
│   ├── ecr/
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   ├── variables.auto.tfvars
│   │   └── variables.tf
│   │
│   ├── eks-flask-app/
│   │   ├── access.tf_notrun
│   │   ├── data.tf
│   │   ├── deploy-app.tf_notrun
│   │   ├── eks.tf
│   │   ├── iam.tf_notrun
│   │   ├── iam_policy.tf_notrun
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   ├── variables.tf
│   │   ├── vpc.tf
│   │   └── k8s/
│   │       ├── deployment.yaml
│   │       └── service.yaml
│   │
│   └── tf-state-s3/
│       ├── main.tf
│       ├── outputs.tf
│       ├── Readme.md
│       └── variables.tf
│
└── webapp/
    ├── Dockerfile
    ├── hello-flask-app.py
    └── requirements.txt
```
---

## 📦 Infrastructure Provisioning

### Prerequisites

- Terraform >= 1.3
- AWS CLI configured
- kubectl installed and configured
- Docker
- Helm

### Provisioning Steps

Provisioning is split into multiple Terraform modules:

#### 1. S3 Backend for Terraform State

```bash
cd terraform/tf-state-s3
terraform init
terraform apply
```
#### 2. ECR Registry

```bash
cd terraform/ecr
terraform init
terraform apply
```
#### 3. ESK cluster

```bash
# Cluster
cd terraform/eks-flask-app
terraform init
terraform apply

```


