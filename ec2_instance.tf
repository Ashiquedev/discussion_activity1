resource "aws_instance" "ec2_practice" {
  ami                         = var.ec2.ami
  availability_zone           = format("${var.region}%s","a")
  instance_type               = var.ec2.instance_type
  key_name                    = aws_key_pair.practice_keypair.key_name
  security_groups             = [aws_security_group.allow_22_80.id]
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  tags                        = {
    Name                      = var.ec2.Name
  }
}