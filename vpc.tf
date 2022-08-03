resource "aws_vpc" "practice" {
  cidr_block          = var.vpc_cidr
  tags                = {
    Name              = var.vpc_name
  }
}