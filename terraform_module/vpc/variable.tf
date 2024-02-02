##======================================================================================##
# VPC BLOCK
##======================================================================================##
variable "vpc_cidr" {
  type    = string
  description = "vpc cidr range"
  default = "10.0.0.0/16"
}

variable "instance_tenency" {
  type    = string
  description = "instance tenency"
  default = "default"
}
variable "vpc_tag" {
  type    = string
  description = "vpc tag name"
  default = "tf-vpc"
}
