output "ec2_public_ip" {
    value = aws_instance.web.public_ip
    description = "This is my public IP"
}



output "sg_id" {
  value = aws_security_group.web.id
}


