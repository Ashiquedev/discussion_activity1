variable "vpc_cidr" {
  type                                   = string
  default                                =  "10.0.0.0/16"
}

variable "vpc_name" {
  type                                   = string
  default                                =  "practice"
}

variable "subnet_name" {
  type                                   = string
  default                                =  "public_subnet_of_practice_vpc"
}

variable "region" {
  type                                   = string
  default                                =  "ap-south-1"
}

variable "sec_grp_name" {
  type                                  = string
  default                               = "allow_22_80"
}

variable "ec2" {
  type                                  = object({
    ami                                 = string
    instance_type                       = string
    Name                                = string
    public_ip_enabled                   = bool
  })
  default = {
   ami                                  = "ami-006d3995d3a6b963b"
   instance_type                        = "t2.micro"
   Name                                 = "ec2_terraform_practice"
   public_ip_enabled                    = true
  }
}