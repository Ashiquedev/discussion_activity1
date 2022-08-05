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
  #user_data = <<EOF
	#	    #!/bin/bash
  #      sudo apt-get update
	#	    sudo apt-get install -y apache2 openjdk-11-jdk
	#	    sudo systemctl start apache2
	#	    sudo systemctl enable apache2
	#EOF
    
  depends_on = [
    aws_vpc.practice,
    aws_security_group.allow_22_80,
    aws_route_table_association.public_rt_association,
    aws_key_pair.practice_keypair
  ]
}
