# Create SSH Key Pair for access
resource "aws_key_pair" "eks_key_pair" {
  key_name   = "eks-node-key"
  public_key = file("files/my-eks-key.pem.pub")
}

# Create a security group to allow SSH (port 22)
resource "aws_security_group" "eks_sg" {
  name_prefix = "eks-node-sg-"
  description = "Allow SSH and communication within the EKS cluster"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.0/32"]  # Replace with your trusted IP address
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
