terraform {
  backend "s3" {
    bucket = "terraform-aug24-123456789"
    key    = "terraform.tfstate" //env/dev/terraform.tfstate 
    region = "us-east-1"
  }
}

///classtasks/workspace/terraform.tfstate -> env:/dev/classtasks/workspace/terraform.tfstate


