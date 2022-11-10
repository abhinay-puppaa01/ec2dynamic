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
  count = var.instance_count
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  #iam_instance_profile   = var.iam_instance_profile
  ebs_optimized          = var.ebs_optimized
  private_ip             = var.private_ip
  tenancy                = var.tenancy
  host_id                = var.host_id
  tags                   = merge({ "Name" = "${var.instance_name}-${count.index}" }, var.tags)

  iam_instance_profile = var.create_iam_instance_profile ? aws_iam_instance_profile.this[0].name : var.iam_instance_profile

  root_block_device {
    volume_size           = var.root_block_device_volume_size
    volume_type           = var.root_block_device_volume_type
    encrypted             = var.ebs_optimized
    delete_on_termination = true
    tags                  = merge({ "Name" = "${var.instance_name}-${count.index}" }, var.tags)
  }

  dynamic "ebs_block_device" {
    for_each = local.ebs_volumes
    content {
      volume_type = lookup(ebs_block_device.value, "volume_type", null)
      volume_size = lookup(ebs_block_device.value, "volume_size", null)
      tags        = merge({ "Name" = "${var.instance_name}-${count.index}" }, var.tags)
      iops        = lookup(ebs_block_device.value, "iops", null)
      device_name = lookup(ebs_block_device.value, "device_name", null)
    }
  }



}


data "aws_iam_policy_document" "assume_role_policy" {
  count = var.create_iam_instance_profile ? 1 : 0

  statement {
    sid     = "EC2AssumeRole"
    actions = ["sts:AssumeRole"]

    principals {
      Service ="ec2.amazonaws.com"
    }
  }
}

resource "aws_iam_role" "this" {
  count =  var.create_iam_instance_profile ? 1 : 0

  name        =  var.iam_role_name
  name_prefix = var.iam_role_name
  description = var.iam_role_description
  assume_role_policy    = data.aws_iam_policy_document.assume_role_policy[0].json
  #assume_role_policy  =var.assume_role_policy  
  force_detach_policies = true

  tags = merge(var.tags, var.iam_role_tags)
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = { for k, v in var.iam_role_policies : k => v if  var.create_iam_instance_profile }
  policy_arn = each.value
  role       = aws_iam_role.this[0].name
}

resource "aws_iam_instance_profile" "this" {
  count =  var.create_iam_instance_profile ? 1 : 0
  role = aws_iam_role.this[0].name
  name        = var.iam_role_name
  name_prefix = var.iam_role_name
  tags = merge(var.tags, var.iam_role_tags)

  lifecycle {
    create_before_destroy = true
  }
}