resource "aws_key_pair" "practice_keypair" {
  key_name        = "deployer-key"
  public_key      = file("~/.ssh/id_rsa.pub")
}
