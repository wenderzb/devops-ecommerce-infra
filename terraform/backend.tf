terraform {
  backend "s3" {
    bucket = "wz-tfstate-ecommerce"
    key    = "terraform/main.tfstate"
    region = "us-east-1"
  }
}