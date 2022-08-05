#resource "null_resource" "install_openjdk" {
#    connection {
#        type        = "ssh"
#        user        = "ubuntu"
#        port        = 22
#        host        = aws_instance.ec2_practice.public_ip
#        private_key = file("~/.ssh/id_rsa.")
#      }
#      provisioner "remote-exec" {
#        inline      = [
#          "#!/bin/bash",
#          "sudo -i",
#          "sudo apt-get update",
#          "sudo apt install openjdk-8-jdk -y"
#        ]
#  }
#}


