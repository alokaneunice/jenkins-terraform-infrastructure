output "public-server" {
  value = aws_instance.public-server.public_ip
}
output "private-server" {
  value = aws_instance.private-server.public_ip
}