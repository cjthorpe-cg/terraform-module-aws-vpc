provider "aws" {
  profile = var.profile
  region  = var.region

  version = ">= 2.28.1"
}
