# AMI 
variable "ami_image_flavor" {
  type = string
  description = "Flavor of images ex. ubuntu"
  default = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  #values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
}
variable "ami_image_virt_type" {
  type = string
  description = "Type of virtualization ex. hvm"
  default =  "hvm"
}
variable "ami_image_owner_id" {
  type = string
  description = "image flavor id ex. for ubuntu"
  default = "099720109477" # Canonical
}