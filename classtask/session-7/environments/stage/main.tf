module "vpc" {
  //Required
  source = "github.com/Gulnazzholshy01/tf-modules-aug24//vpc?ref=v1.0.0"



  //variables
  env = "dev"
  vpc_name = "My-VPC"
  subnets_az = ["us-east-1a", "us-east-1b", "us-east-1c"]
  subnet_name = [1, 2, 3]
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidr_block = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr_block = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]

}

/*

?ref=v1.2.0
?ref=COMMIT_HASH
?ref=BRANCH_NAME

*/