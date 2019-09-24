variable "profile" {
  description = "The AWS profile to utilise."
}

variable "region" {
  description = "The region to build infrastructure within."
  default = "eu-west-2"
}

variable "workspace" {
  description = "The name of the workspace hosting the VPC."
}

variable "prefix" {
  description = "The naming prefix to use."
}

variable "owner" {
  description = "Identifying name of the resource owner."
}

variable "vpc_cidr" {
  description = "The CIDR range to use for the VPC."
}

variable "public_subnet_cidr" {
  description = "The public subnet CIDRs to use."
  type = list
  default = []
}

variable "private_subnet_cidr" {
  description = "The private subnet CIDRs to use."
  type = list
  default = []
}
