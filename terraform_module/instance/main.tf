# Public EC2 Instance
resource "aws_instance" "public_instance" {
  count                  = length(var.public_subnet_id)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id[count.index] #aws_subnet.public_subnets[count.index].id
  key_name               = var.key  # Change this to your key pair name
  associate_public_ip_address = true
  security_groups = [var.sec_groups] #[ aws_security_group.my_security_group.id ]

  tags = {
    count = length(var.public_instance_tag)
    Name = var.public_instance_tag[count.index]
  }
}

# Private EC2 Instance
resource "aws_instance" "private_instance" {
  count                  = length(var.private_subnet_id)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id[count.index] #aws_subnet.private_subnets[count.index].id
  key_name               = var.key  # Change this to your key pair name
  associate_public_ip_address = false
  security_groups = [var.sec_groups] #[ aws_security_group.my_security_group.id ]

  tags = {
    count = length(var.private_instance_tag)
    Name = var.private_instance_tag[count.index]
  }
}
