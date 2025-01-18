terraform {
  backend "s3" {
    bucket = "terraform-aug24-123456789"
    key    = "classtasks/session-9/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock-aug24"
  }
}