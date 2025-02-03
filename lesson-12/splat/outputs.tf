output "Group_ids" {
  value = aws_security_group.multiple_groups[*]
}