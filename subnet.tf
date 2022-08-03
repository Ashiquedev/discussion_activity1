resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.practice.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 0)
  tags              = {
    Name            = var.subnet_name
  }
  availability_zone = format("${var.region}%s","a")
  depends_on        = [
    aws_vpc.practice
  ]
}

