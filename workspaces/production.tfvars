profile = "thorpecorp"

region = "eu-west-1"

workspace = "production"

prefix = "vpc"

owner = "thorpecorp"

// Allocate 65536 IP addresses to the VPC.

vpc_cidr = "10.0.0.0/16"

// Allocate 256 IP addresses to each subnet - two public and two private.

public_subnet_cidr = ["10.0.0.0/24","10.0.1.0/24"]

private_subnet_cidr = ["10.0.2.0/24","10.0.3.0/24"]
