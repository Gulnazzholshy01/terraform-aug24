terraform {
  backend "s3" {
    bucket = "terraform-aug24-123456789"
    key    = "classtasks/session-8/terraform.tfstate"
    region = "us-east-1"
  }
}