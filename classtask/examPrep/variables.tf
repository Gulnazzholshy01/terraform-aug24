variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "This is Instance Type"
}

variable "instance_name" {
  type = string
  default = "My-Webserver"
  description = "This is My Webserver"
}

variable "security_group_name" {
  type        = string
  default     = "MySG"
  description = "This is My Security Group"
}

variable "env" {
  type        = string
  default     = "prod"
  description = "This is My Dev Environment"
}

/*
3 ways of giving variables:

1. config file, define var with default value (variables.tf)
2. define var without default value, + command line (terraform apply -var=instance_type=t2.micro)
3. define var without default value, + export as ENV VAR (export TF_VAR_instance_type=t2.micro)
*/ 