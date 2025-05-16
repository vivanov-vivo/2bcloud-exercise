---
# How to create nodegroup role
---
```bash
 aws iam create-role \
  --role-name vi-eks-nodegroup-role \
  --assume-role-policy-document file://eks-nodegroup-trust-policy.json
```
```bash
aws iam attach-role-policy \
  --role-name vi-eks-nodegroup-role \
  --policy-arn arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy
```
```bash
aws iam attach-role-policy \
  --role-name vi-eks-nodegroup-role \
  --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly
```
```bash
aws iam attach-role-policy \
  --role-name vi-eks-nodegroup-role \
  --policy-arn arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy
```
```bash
aws iam put-role-policy \
  --role-name vi-eks-nodegroup-role \
  --policy-name AllowLaunchTemplateAccess \
  --policy-document file://launch-template-access-policy.json
```

## How to verify role
```bash
aws iam get-role --role-name vi-eks-nodegroup-role
aws iam list-attached-role-policies --role-name vi-eks-nodegroup-role
aws iam list-role-policies --role-name vi-eks-nodegroup-role
```
---

# How to create custer role
---
```bash
aws iam create-role \
  --role-name vi-eks-cluster-role \
  --assume-role-policy-document file://eks-cluster-trust-policy.json
```
```bash
aws iam attach-role-policy \
  --role-name vi-eks-cluster-role \
  --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy
```
```bash
aws iam attach-role-policy \
  --role-name vi-eks-cluster-role \
  --policy-arn arn:aws:iam::aws:policy/AmazonEKSServicePolicy
```
```bash
aws iam attach-role-policy \
  --role-name vi-eks-cluster-role \
  --policy-arn arn:aws:iam::aws:policy/AmazonEKSComputePolicy
```

## How to verify role
```bash
aws iam get-role --role-name vi-eks-cluster-role
aws iam list-attached-role-policies --role-name vi-eks-cluster-role
aws iam list-role-policies --role-name vi-eks-cluster-role
```
---
