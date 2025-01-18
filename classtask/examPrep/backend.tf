terraform {
  backend "s3" {
    bucket = "terraform-aug24-123456789"
    key    = "classtasks/examPrep/test/terraform.tfstate"
    region = "us-east-1"
  }
}