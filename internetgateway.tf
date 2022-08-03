resource "aws_internet_gateway" "igw" {
  vpc_id                = aws_vpc.practice.id
  tags                  = {
    Name                = "practice_vpc_igw"
  }
  depends_on            = [
    aws_subnet.public_subnet
  ]
}