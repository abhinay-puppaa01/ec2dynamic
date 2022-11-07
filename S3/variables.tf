variable "bucket_name" {
  description = "The name of the S3 private bucket."
  type        = string
  default     = null
}

variable "logging_bucket" {
  description = "The logging bucket for the bucket that's being created."
  type        = string
}
variable "region" {
  description = "The logging bucket for the bucket that's being created."
  type        = string
   default     = "us-east-1"
}

 
variable "enable_versioning" {
  description = "Whether or not enable bucket versioning."
  type        = bool
  default     = false
}

variable "enable_logging" {
  description = "Whether or not enable bucket versioning."
  type        = bool
  default     = false
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