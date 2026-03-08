resource "aws_ecr_repository" "this" {
  for_each = var.repositories

  name                 = "${var.project}-${var.env}-${each.key}"
  image_tag_mutability = each.value.mutable_tags ? "MUTABLE" : "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = each.value.scan_on_push
  }

  tags = merge(
    {
      Name        = "${var.project}-${var.env}-${each.key}"
      Project     = var.project
      Environment = var.env
    },
    var.extra_tags
  )
}

resource "aws_ecr_lifecycle_policy" "this" {
  for_each = aws_ecr_repository.this

  repository = each.value.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep only last 10 images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 10
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}