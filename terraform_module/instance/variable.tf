# Instance Name
variable "public_instance_tag" {
  type = list(string)
  default = [ "tf-public-1","tf-public-2"]
}
variable "private_instance_tag" {
  type = list(string)
  default = ["tf-private-1","tf-private-2" ]
}
# Instance Type
variable "instance_type" {
  type = string
  description = "Type of instance"
  default = "t2.micro"
}
# Key Pair
variable "key" {
  type = string
  description = "key pair name"
  default = "tokyo"
}
variable "ami_id" {
  type = string
}
variable "public_subnet_id" {
  type = list(string)
}
variable "private_subnet_id" {
  type = list(string)
}
variable "sec_groups" {
  type = string
}
