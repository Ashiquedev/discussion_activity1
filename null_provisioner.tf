resource "null_resource" "install_openjdk" {
    connection {
        type        = "ssh"
        user        = "ubuntu"
        port        = 22
        host        = aws_instance.ec2_practice.public_ip
        private_key = file("~/.ssh/id_rsa.")
      }
      provisioner "remote-exec" {
        inline      = [
          "#!/bin/bash",
          "sudo touch 1.txt",
          "sudo apt update",
          #"sudo apt-get -f autoremove -y",
          "sudo apt-get update -y",
          "sudo apt-get upgrade -y",
          "sudo apt-get dist-upgrade -y",
          "sudo apt install apache2 -y",
          "sudo apt install openjdk-11-jdk -y"
   ]
  }
}


