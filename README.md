# terraform-module-aws-vpc
Terraform module to create an AWS VPC.

### Background

Creates:
 
- a variable number of public subnets attached to an Internet Gateway.
- A variable number of private subnets each with an attached NAT Gateway with an Elastic IP.

Also creates the required public/private route tables and route associations.

### Usage

```
module "vpc" {
  source              = "github.com/cthorpe-cg/terraform-module-aws-vpc"
  profile             = "${var.profile}"
  workspace           = "${var.workspace}"
  prefix              = "${var.prefix}"
  owner               = "${var.owner}"
  vpc_cidr            = "${var.vpc_cidr}"
  public_subnet_cidr  = "${var.public_subnet_cidr}"
  private_subnet_cidr = "${var.private_subnet_cidr}"
}
```
