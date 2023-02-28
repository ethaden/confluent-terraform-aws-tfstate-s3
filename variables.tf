# Recommendation: Overwrite the default in tfvars or by specify an environment variable TF_VAR_aws_region
variable "aws_region" {
  type        = string
  default     = "eu-central-1"
  description = "The AWS region to be used"
}

variable "purpose" {
  type        = string
  default     = "Infrastructure"
  description = "The purpose of this configuration, used e.g. as tags for AWS resources"
}

variable "owner" {
  type        = string
  default     = ""
  description = "All resources are tagged with an owner tag. If none is provided in this variable, a useful value is derived from the environment"
}

# The validator uses a regular expression for valid email addresses (but NOT complete with respect to RFC 5322)
variable "owner_email" {
  type        = string
  default     = ""
  description = "All resources are tagged with an owner_email tag. If none is provided in this variable, a useful value is derived from the environment"
  validation {
    condition = anytrue([
      var.owner_email == "",
      can(regex("^[a-zA-Z0-9_.+-]+@([a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9]+)*\\.)+[a-zA-Z]+$", var.owner_email))
    ])
    error_message = "Please specify a valid email address for variable owner_email or leave it empty"
  }
}

variable "owner_fullname" {
  type        = string
  default     = ""
  description = "All resources are tagged with an owner_fullname tag. If none is provided in this variable, a useful value is derived from the environment"
}

variable "username" {
    type = string
    default = ""
    description = "Username, used to define local.username if set here. Otherwise, the logged in username is used."
}

variable "resource_prefix" {
  type        = string
  default     = ""
  description = "This string will be used as prefix for generated resources"
}
