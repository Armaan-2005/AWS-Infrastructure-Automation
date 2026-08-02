resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits = 2048
}
resource "local_file" "priv_key" {
    filename = "my-key.pem"
    content = tls_private_key.key.private_key_pem
}
resource "aws_key_pair" "key_pair" {
  key_name = "my_key"
  public_key = tls_private_key.key.public_key_openssh
}