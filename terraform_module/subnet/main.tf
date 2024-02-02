#======================= Create Subnet================================#

#=> PRIVATE SUBNET
resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidr)

  vpc_id                  = var.myvpc
  cidr_block              = var.private_subnet_cidr[count.index]
  availability_zone       = element(var.aws_az, count.index % length(var.aws_az))
  map_public_ip_on_launch = false
  tags = {
    Name = var.private_subnet_tag[count.index]
  }
}

#=> PUBLIC SUBNET
resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidr)

  vpc_id                  = var.myvpc
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = element(var.aws_az, count.index % length(var.aws_az))
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_tag[count.index]
  }
}
