resource "aws_s3_bucket" "terraform_state" {
  bucket = "wz-tfstate-${var.project}"
  region = var.region

  tags = merge(
    { Name = "wz-tfstate-${var.project}" },
    var.extra_tags
  )

  lifecycle {
    prevent_destroy = true
  }
}