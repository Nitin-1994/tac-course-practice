output "pubip" {
  value = aws_instance.lesson-6.public_ip
}

output "pubdns" {
  value = aws_instance.lesson-6.public_dns
}