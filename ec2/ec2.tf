resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_ssh" #allow_ssh is already exists
  description = "Allow port number 22 for SSH access"

  tags = {
    Name = "allow_ssh"
  }

  #usuall allow everything in egress- outgoing traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  #incomming traffic- restriction
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }
}