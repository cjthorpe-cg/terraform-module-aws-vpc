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
  owner               = "${var.owner}"
  private_subnet_cidr = "${var.private_subnet_cidr}"
  profile             = "${var.profile}"
  public_subnet_cidr  = "${var.public_subnet_cidr}"
  source              = "github.com/cthorpe-cg/terraform-module-aws-vpc"
  vpc_cidr            = "${var.vpc_cidr}"
  workspace           = "${var.workspace}"
}
```
