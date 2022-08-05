resource "aws_instance" "ec2_practice" {
  count                       = 1
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
  connection {
        type        = "ssh"
        user        = "ubuntu"
        port        = 22
        host        = self.public_ip
        private_key = file("~/.ssh/id_rsa.")
      }
  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
    ]
  }
  depends_on = [
    aws_vpc.practice,
    aws_security_group.allow_22_80,
    aws_route_table_association.public_rt_association,
    aws_key_pair.practice_keypair
  ]
}
