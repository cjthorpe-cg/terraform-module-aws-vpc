variable "owner" {
  default     = ""
  description = "Identifying name of the resource owner."
  type        = string
}

variable "prefix" {
  default     = ""
  description = "The naming prefix to use."
  type        = string
}

variable "private_subnet_cidr" {
  default     = []
  description = "The private subnet CIDRs to use."
  type        = list
}

variable "profile" {
  default     = ""
  description = "The AWS profile to utilise."
  type        = string
}

variable "public_subnet_cidr" {
  default     = []
  description = "The public subnet CIDRs to use."
  type        = list
}

variable "region" {
  default     = ""
  description = "The region to build infrastructure within."
  type        = string
}

variable "vpc_cidr" {
  default     = ""
  description = "The CIDR range to use for the VPC."
  type        = string
}

variable "workspace" {
  default     = ""
  description = "The name of the workspace hosting the VPC."
  type        = string
}
