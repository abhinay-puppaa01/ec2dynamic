output "ec2_id" {
  description = "The ID of the instance"
  value       = try(aws_instance.ec2_test.id, "")
}

output "ec2_test_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = try(aws_instance.ec2_test.public_ip, "")
}

output "ec2_test_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = try(aws_instance.ec2_test.tags, {})
}
output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = try(aws_instance.ec2_test.primary_network_interface_id, "")
}
output "ec2_instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.ec2_test.instance_state
}

output "root_block_device_volume_id" {
  description = "The volume Id of root block device"
  value       = aws_instance.ec2_test.root_block_device[0].volume_id
}

output "root_block_device_volume_size" {
  description = "The volume size of root block device"
  value       = aws_instance.ec2_test.root_block_device[0].volume_size
}
output "root_block_device_volume_type" {
  description = "The volume type of root block device"
  value       = aws_instance.ec2_test.root_block_device[0].volume_type
}
output "root_block_device" {
  description = "The name of root block device"
  value       = aws_instance.ec2_test.root_block_device[0].device_name
}
output "root_block_device_encrytion" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.ec2_test.root_block_device[0].encrypted
}
/*
output "ebs_block_device" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
    value       = aws_instance.ec2_test.ebs_block_device
    
}*/
output "ebs_block_device" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.ec2_test.ebs_block_device

}

output "ebs_block_device1" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = local.ebs_volumes

}
/*output "ebs_block_device2" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
 
value       = [for i in aws_instance.ec2_test.ebs_block_device : {
      device_name    = aws_instance.ec2_test.ebs_block_device[*].device_name
      volume_size    = aws_instance.ec2_test.ebs_block_device[*].volume_size
      volume_type = aws_instance.ec2_test.ebs_block_device[*].volume_type
      iops = aws_instance.ec2_test.ebs_block_device[*].iops
    }]
}*/







