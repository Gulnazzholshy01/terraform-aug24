module "s3_bucket" {
  for_each = var.s3_bucket_names
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = each.value
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}



/*

ClassTask

create 3 S3 buckets with for_each

1. create var - s3-bucket-names 
2. for_each, each.key

*/