output "vpc_id" {
    value = aws_vpc.main.id
}

output "public_subnet1a_id" {
    value = aws_subnet.public1a.id
}

output "private_subnet1a_id" {
    value = aws_subnet.private1a.id
}
