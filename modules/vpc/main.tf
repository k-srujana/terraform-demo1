resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet
}

resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
}