terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.0"
    }
  }
}

/*
1. Create EC2 for DEV env, should have its own state file
2. Create EC2 for PROD env,  should have its own state file

WORKSPACE -> default, dev, prod

- use same config files to create identical resources (DONE)
- can have their own variables  (DONE)
- have their own state file 

* YOU CAN NOT USE VARIABLES IN TERRAFORM BACKEND BLOCK 


CLASSTASK:
1. create 2 workspace: dev, prod
2. create ec2 in each env/workspace


1. create ws prod
2. create ec2 in prod
*/