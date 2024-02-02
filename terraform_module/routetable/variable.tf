# Route Table
variable "public_route_tag" {
  type = string
  description = "Name of route table"
  default = "tf-public-route"
}

variable "private_route_tag" {
  type = string
  description = "Name of route table"
  default = "tf-private-route"
}

variable "myvpc" {
  type = string
}
variable "myigw" {
  type = string
}
variable "mynat" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "cidr_blocks" {
  type = string
}