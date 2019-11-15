resource "aws_vpc" "workspace" {
  cidr_block = var.vpc_cidr

  tags = {
    Name  = "${var.workspace}-vpc"
    Owner = var.owner
  }
}

// Create subnets.

resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.workspace.id
  cidr_block        = var.public_subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name  = "${var.workspace}-public-${count.index}"
    Owner = var.owner
  }

  lifecycle {
    create_before_destroy = true
  }

  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.workspace.id
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name  = "${var.workspace}-private-${count.index}"
    Owner = var.owner
  }

  lifecycle {
    create_before_destroy = true
  }

  map_public_ip_on_launch = false
}

// Create Internet Gateway for the public subnets.

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.workspace.id

  tags = {
    Name  = "${var.workspace}-igw"
    Owner = var.owner
  }
}

// Create NAT gateway for each of the private subnets.

resource "aws_nat_gateway" "private" {
  count         = length(var.private_subnet_cidr)
  allocation_id = aws_eip.nat.*.id[count.index]
  subnet_id     = aws_subnet.public.*.id[count.index]

  depends_on = ["aws_internet_gateway.public"]

  lifecycle {
    create_before_destroy = true
  }
}

// Elastic IP for each NAT gateway.

resource "aws_eip" "nat" {
  count = length(var.private_subnet_cidr)
  vpc   = true
}

// Create route tables for public/private subnets.

resource "aws_route_table" "public" {
  count  = length(var.public_subnet_cidr)
  vpc_id = aws_vpc.workspace.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public.id
  }

  tags = {
    Name  = "${var.workspace}-public-${count.index}"
    Owner = var.owner
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.public.*.id[count.index]
  route_table_id = aws_route_table.public.*.id[count.index]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table" "private" {
  count  = length(var.private_subnet_cidr)
  vpc_id = aws_vpc.workspace.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.private.*.id[count.index]
  }

  tags = {
    Name  = "${var.workspace}-private-${count.index}"
    Owner = var.owner
  }
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = aws_subnet.private.*.id[count.index]
  route_table_id = aws_route_table.private.*.id[count.index]

  lifecycle {
    create_before_destroy = true
  }
}
