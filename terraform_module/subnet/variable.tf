# PRIVATE SUBNET

variable "private_subnet_cidr" {
  description = "private subnet cidr range"
  type = list(string)
  default = ["10.0.0.0/18","10.0.64.0/18"]
}

variable "private_subnet_tag" {
  description = "private subnet names"
  type = list(string)
  default = ["tf-private-subnet-1","tf-private-subnet-2"]
}

##===================================================================================##
# PUBLIC SUBNET
variable "public_subnet_cidr" {
  description = "public subnet cidr range"
  type = list(string)
  default = ["10.0.128.0/18","10.0.192.0/18"]
}

variable "public_subnet_tag" {
  description = "public subnet name"
  type = list(string)
  default = ["tf-public-subnet-1","tf-public-subnet-2"]
}

variable "aws_az" {
  type = list(string)
  default = [ "ap-northeast-1a","ap-northeast-1c" ]
}

variable "myvpc" {
  type = string
}