variable "instance_type" {
  type = string
  description = "This is Instance Type"
  default = "t2.micro"
}


variable "env" {
  type        = string
  default     = "prod"
  description = "This is My Dev Environment"
}