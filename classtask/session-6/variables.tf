variable "instance_name" {
  type        = string
  default     = "My-Webserver"
  description = "This is My Webserver"
}

variable "security_group_name" {
  type        = string
  default     = "MySG"
  description = "This is My Security Group"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "This is My Dev Environment"
}

variable "ports" {
  type        = list(number)
  default     = [22, 80, 443, 3369]
  description = "List of ports"
}

variable "cidrs" {
  type        = list(string)
  default     = ["0.0.0.0/0", "73.74.183.123/32", "0.0.0.0/0", "0.0.0.0/0"]
  description = "List of ports"
}


variable "ports_sg" {
  type = map(object({
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = string
  }))
  default = {
    ssh = {
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr_ipv4   = "73.74.183.123/32"
    }
    http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
    https = {
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
}

######Naming and Tagging#########
variable "cloud" {
  default = "aws"
}

variable "region" {
  default = "use1"
}


variable "team" {
  default = "DevOps"
}

variable "project" {
  default = "skylight"
}

variable "app_tier" {
  default = "frontend"
}

variable "resource_type" {
  default = "ec2"
}

variable "department" {
  default = "finance"
}


variable "managed_by" {
  default = "terraform"
}

variable "owner" {
  default = "Gulnaz"
}

variable "instance_type" {
  type        = list(string)
  default     = ["t2.micro", "t2.medium"]
  description = "This is Instance Type"
}


