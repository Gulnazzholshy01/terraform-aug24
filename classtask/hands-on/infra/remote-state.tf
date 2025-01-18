data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket         = "terraform-aug24-123456789"
    key            = "classtasks/hands-on/terraform.tfstate"
    region         = "us-east-1"
  }
}

/*
REFERENCE to resource attr:



*/