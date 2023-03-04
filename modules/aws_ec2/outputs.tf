output "id" {
  value = aws_instance.instance.id
}
output "ipv4" {
  value = aws_instance.instance.public_ip
}
