output "public_subnet_ids" {
    value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
    value = aws_subnet.private[*].id
}

output "main_vpc_id" {
    value = aws_vpc.myVPC.id
}

output "db_subnet_group_name" {
    value = aws_db_subnet_group.default.name
}

