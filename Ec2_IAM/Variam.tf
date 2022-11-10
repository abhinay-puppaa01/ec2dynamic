variable "create_iam_instance_profile" {
  description = "Determines whether an IAM instance profile is created or to use an existing IAM instance profile"
  type        = bool
  default     = false
}

variable "iam_role_name" {
  description = "Name to use on IAM role created"
  type        = string
  default     = null
}

variable "iam_role_use_name_prefix" {
  description = "Determines whether the IAM role name (`iam_role_name` or `name`) is used as a prefix"
  type        = bool
  default     = true
}

variable "iam_role_path" {
  description = "IAM role path"
  type        = string
  default     = null
}

variable "iam_role_description" {
  description = "Description of the role"
  type        = string
  default     = null
}

variable "iam_role_permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the IAM role"
  type        = string
  default     = null
}

variable "iam_role_policies" {
  description = "Policies attached to the IAM role"
  type        = map(string)
  default     = {"policy1":"arn:aws:iam::213601731133:policy/ec2-vrac-test-policy" }
}

variable "iam_role_tags" {
  description = "A map of additional tags to add to the IAM role/profile created"
  type        = map(string)
  default     = {
    "name":"test-tag"
  }
}

variable "assume_role_policy" {
  description = "Policies attached to the IAM role"
  type        = map(string)
  default     = {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:RebootInstances",
                "ec2:DeleteVolume",
                "ec2:ModifyVolume",
                "ec2:DescribeInstances",
                "ec2:TerminateInstances",
                "ec2:DeleteTags",
                "ec2:StartInstances",
                "s3:*",
                "ec2:CreateTags",
                "ec2:RunInstances",
                "ec2:ModifyInstanceAttribute",
                "ec2:StopInstances"
            ],
            "Resource": "*"
        }
    ]
}
}