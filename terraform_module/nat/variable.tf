# NAT
variable "nat_tag" {
  type = string
  description = "Name of NAT gateway"
  default = "tf-nat"
}
variable "eip_nat" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}