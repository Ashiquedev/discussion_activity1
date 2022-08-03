resource "aws_route_table" "public_rt" {
  vpc_id       = aws_vpc.practice.id 
  route {
    gateway_id = aws_internet_gateway.igw.id 
    cidr_block = local.ipv4_cidr_access_by_all[0]
  }
  tags = {
    Name       = "public_rt"
  }
  depends_on   = [
    aws_security_group.allow_22_80,
    aws_internet_gateway.igw
  ]
}



