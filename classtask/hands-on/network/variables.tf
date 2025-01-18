variable "env" {
  description = "Environment name"
  default     = "prod"
  type        = string
}

variable "vpc_cidr_block" {
    description = "VPC CIDR"
    default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
	type = list
	default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidr" {
	type = list
    default = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

variable "azs_for_public_subnets" {
	type = list
	default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "azs_for_private_subnets" {
	type = list
	default = ["us-east-1d", "us-east-1e", "us-east-1f"]
	
}
