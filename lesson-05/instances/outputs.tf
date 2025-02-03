output "pubip" {
  value = aws_instance.lesson-5.public_ip
}

output "pubdns" {
  value = aws_instance.lesson-5.public_dns
}