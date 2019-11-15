profile = "thorpecorp"

region = "eu-west-2"

workspace = "production"

owner = "thorpecorp"

// Allocate 65536 IP addresses to the VPC.

vpc_cidr = "172.20.0.0/23"

// Allocate 256 IP addresses to each subnet - two public and two private.

public_subnet_cidr = ["172.20.0.0/25","172.20.1.0/25"]

private_subnet_cidr = ["172.20.2.0/25","172.20.3.0/25"]
