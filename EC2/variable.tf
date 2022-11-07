variable "access_key" {
  description = "The username of the user account used to access the Morpheus platform"
  type        = string
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}


variable "ami" {
  description = "Ami"
  type        = string
  default     = "ami-0cff7528ff583bf9a"
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t2.micro"
}
variable "instance_name" {
  description = "Instance Name"
  type        = string
  default     = "amraeld00010181"
}


variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  type        = string
  default     = null
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = null
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
  default     = null
}
variable "tenancy" {
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host."
  type        = string
  default     = null
}
variable "host_id" {
  description = "ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host"
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "availability_zone"
  type        = string
  default     = "us-east-1a"
}

variable "subnet_id" {
  description = "subnet_id"
  type        = string
  default     = "subnet-c9b14995"
}
variable "vpc_security_group_ids" {
  description = "vpc_security_group_ids"
  type        = list(any)
  default     = ["sg-020b807bdccc81145"]
}
variable "tags" {
  description = "tags"
  type        = map(any)
  default = {
    "CostCenterID" : "CostCenterID"
    "Centrify" : "Centrify"
    "Description" : "Description"
    "ProjectCode" : "ProjectCode"
    "SharedInfrastructure" : "SharedInfrastructure"
    "ApplicationDeploymentCIID" : "ApplicationDeploymentCIID"
    "ProvisionType" : "ProvisionType"
  }
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default     = []
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  type        = string
  default     = null
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = null
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
  default     = null
}
variable "tenancy" {
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host."
  type        = string
  default     = null
}
variable "host_id" {
  description = "ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host"
  type        = string
  default     = null
}


variable "root_block_device_volume_type" {
  description = "root_block_device_volume_type"
  type        = string
  default     = "gp2"
}
variable "root_block_device_volume_size" {
  description = "root_block_device_volume_size"
  type        = string
  default     = "8"
}



