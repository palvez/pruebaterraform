resource "aws_vpc" "test-terraform-vpc" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_internet_gateway" "test-terraform-ig" {
  vpc_id = aws_vpc.test-terraform-vpc.id
}

resource "aws_default_route_table" "test-terraform-rt" {
  default_route_table_id = aws_vpc.test-terraform-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-terraform-ig.id
  }

  tags = {
    Name = "Salida a internet"
  }
}

resource "aws_subnet" "vpc-subnet-us-east-1a" {
  vpc_id     = aws_vpc.test-terraform-vpc.id
  cidr_block = "172.16.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "VPC US-East-1a"
  }
}
