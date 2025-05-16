# 2bcloud Exercise

## 📄 Overview

This repository contains infrastructure code, CI/CD pipeline configurations, Helm charts, and application code for deploying a Flask-based web application on EKS using Terraform.

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


