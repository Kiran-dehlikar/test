# Security Groups

variable "ingress_ports" {
  description = "List of ingress ports for the security group"
  type        = list(number)
  default     = [22,80]
}
variable "egress_ports" {
  description = "List of egress ports for the security group"
  type        = list(number)
  default     = [0]
}
variable "cidr_blocks" {
  description = "List of CIDR blocks for the security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "myvpc" {
  type = string
}
variable "sec_groups_name" {
  type = string
  default = "tf-sg"
}