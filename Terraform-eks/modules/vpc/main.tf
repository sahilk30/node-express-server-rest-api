resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "eks-vpc"
  }
}

resource "aws_subnet" "subnet" {
  count           = 2
  vpc_id          = aws_vpc.vpc.id
  cidr_block      = cidrsubnet(var.cidr_block, 8, count.index)
  map_public_ip_on_launch = true
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)
  tags = {
    Name = "eks-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "route_table_association" {
  count          = 2
  subnet_id      = element(aws_subnet.subnet.*.id, count.index)
  route_table_id = aws_route_table.route_table.id
}
