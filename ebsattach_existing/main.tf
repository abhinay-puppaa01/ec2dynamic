
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
      instance_id = var.instance_id
    }