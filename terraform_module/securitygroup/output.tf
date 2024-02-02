output "security_groups_out" {
  value = aws_security_group.my_security_group.id
  description = "Security Group ID"
}