output "subnet_1_id" {
  value = aws_subnet.public_1.id
}

output "subnet_2_id" {
  value = aws_subnet.public_2.id
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "private_subnet_1_id" {
  value = aws_subnet.private_1.id
}