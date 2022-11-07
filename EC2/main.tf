resource "aws_instance" "ec2_test" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile   = var.iam_instance_profile
  ebs_optimized        = var.ebs_optimized
  private_ip                  = var.private_ip
  tenancy                   = var.tenancy
  host_id       = var.host_id
  tags                   = merge({ "Name" = var.instance_name }, var.tags)

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content { 
      volume_type = lookup(ebs_block_device.value, "volume_type",null)
      volume_size = lookup(ebs_block_device.value, "volume_size",null)
      tags        = {"Host-Ec2"=var.instance_name}
      iops        = lookup(ebs_block_device.value, "iops",null)
      device_name = lookup(ebs_block_device.value, "device_name",null)
    }
  }



}