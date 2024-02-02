# Security Group for Instances
resource "aws_security_group" "my_security_group" {
  name        = var.sec_groups_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = var.myvpc

  dynamic "ingress" {
    for_each = var.ingress_ports

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_ports

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "-1"
      cidr_blocks = var.cidr_blocks
    }
  }
}