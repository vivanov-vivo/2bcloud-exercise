resource "aws_ecr_repository" "ecr" {
  name                 = var.ecr_name[0]
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.tags
}
resource "aws_ecr_repository" "ecr1" {
  name                 = var.ecr_name[1]
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.tags
}
resource "aws_ecr_repository" "ecr2" {
  name                 = var.ecr_name[2]
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.tags
}

