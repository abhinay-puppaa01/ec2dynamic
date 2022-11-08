
variable "ebs_block_device_name" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(string)
  default     = ["xvdf","xvdg"]
}
variable "ebs_block_volume_size" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(string)
  default     = ["10","10"]
}
variable "ebs_block_volume_type" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(string)
  default     = ["gp3","gp3"]
}
variable "ebs_block_volume_iops" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(string)
  default     = ["3000","300"]
}


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
output "variable" {

value=local.ebs_volumes

}
    