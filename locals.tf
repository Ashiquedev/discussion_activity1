locals {
  ssh_port                = 22
  app_port                = 80
  tcp_protocal            = "tcp"
  ipv4_cidr_access_by_all = ["0.0.0.0/0"]
  ipv6_cidr_access_by_all = ["::/0"]
  egress_port_open_to_all = 0
  egress_protocal         = "-1"
  ingress_desc_22         = "allow_22"
  ingress_desc_80         = "allow_80"
}