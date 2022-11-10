locals {
  ebs_volumes = tolist([
    for i, n in var.ebs_block_device_name : {
      device_name    = var.ebs_block_device_name[i]
      volume_size    = var.ebs_block_volume_size[i]
      volume_type = var.ebs_block_volume_type[i]
      iops = var.ebs_block_volume_iops[i]
    }
  ])
}

resource "aws_instance" "ec2_test" {
  #count = var.instance_count
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile   = var.iam_instance_profile
  ebs_optimized          = var.ebs_optimized
  private_ip             = var.private_ip
  tenancy                = var.tenancy
  host_id                = var.host_id
  tags                   = merge({ "Name" = "${var.instance_name}-" }, var.tags)

  root_block_device {
    volume_size           = var.root_block_device_volume_size
    volume_type           = var.root_block_device_volume_type
    encrypted             = var.ebs_optimized
    delete_on_termination = true
    tags                  = merge({ "Name" = "${var.instance_name}" }, var.tags)
  }

}

resource "aws_ebs_volume" "ebs_volume" {
      count             = length(var.ebs_block_device_name)
      availability_zone = var.availability_zone
      size              = var.ebs_block_volume_size[count.index]
      iops =var.ebs_block_volume_iops[count.index]
      type = var.ebs_block_volume_type[count.index]
    }

resource "aws_volume_attachment" "volume_attachement" {
      count       = length(var.ebs_block_device_name)
      volume_id   = element(aws_ebs_volume.ebs_volume.*.id, count.index)
      device_name = element(var.ebs_block_device_name, count.index)
      instance_id = aws_instance.ec2_test.id
    }