resource "aws_instance" "web" {
  count                  = 3
  ami                    = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.web.id]
  instance_type          = var.env == "prod" ? var.instance_type[1] : var.instance_type[0]
  user_data              = file("./extras/userdata.sh")

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    { Name = format(local.Name, "ec2-${count.index}") },
    local.common_tags
  )
}


/*
 for -> transform a value

 Loop through LIST : output LIST
 syntax: [for <ITEM> in <LIST> : OUTPUT]

 Loop through LIST : output MAP
 syntax: [for <ITEM> in <LIST> : OUTPUT_KEY => OUTPUT_VALUE]

 Loop through MAP : output MAP
 syntax: [for <KEY>, <VALUE in <MAP> : OUTPUT_KEY => OUTPUT_VALUE]


 1. instance_ids
 2. public_ips
 3. Name=id
*/

output "instance_ids" {
  value = [for instance in aws_instance.web : instance.id ]
}
// List => Map : instance_name = instance_id

output "instance_ids_old" {
  value = aws_instance.web[*].id
}

output "instance_pub_ip" {
  value = [for ip in aws_instance.web : ip.public_ip]
}

output "instance_pub_ip_with_names" {
  value = { for ip in aws_instance.web : ip.tags["Name"] => ip.public_ip }
}

output "public_ips_name" {
    value = {for ip in aws_instance.web  : ip.tags["Name"] => ip.id}
}

//Name_of_instance = "3.87.191.132"