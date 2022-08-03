resource "aws_security_group" "allow_22_80" {
  name               = var.sec_grp_name
  vpc_id             = aws_vpc.practice.id
  ingress {
    description      = local.ingress_desc_22
    from_port        = local.ssh_port
    to_port          = local.ssh_port
    protocol         = local.tcp_protocal
    cidr_blocks      = local.ipv4_cidr_access_by_all
    ipv6_cidr_blocks = local.ipv6_cidr_access_by_all
  }
  ingress {
    description      = local.ingress_desc_80
    from_port        = local.app_port
    to_port          = local.app_port
    protocol         = local.tcp_protocal
    cidr_blocks      = local.ipv4_cidr_access_by_all
    ipv6_cidr_blocks = local.ipv6_cidr_access_by_all
  }
  egress {
    from_port        = local.egress_port_open_to_all
    to_port          = local.egress_port_open_to_all
    protocol         = local.egress_protocal
    cidr_blocks      = local.ipv4_cidr_access_by_all
    ipv6_cidr_blocks = local.ipv6_cidr_access_by_all
  }
  tags               = {
    Name             = var.sec_grp_name
  }
  depends_on         = [
    aws_internet_gateway.igw,
    aws_subnet.public_subnet
  ]
}