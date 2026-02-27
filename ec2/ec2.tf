#aws_instance - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "terraform" {
    ami                     = "ami-0220d79f3f480ecf5"
    instance_type           = "t3.micro"
    vpc_security_group_ids  = [aws_security_group.allow_ssh_terraform.id]
    tags = {
        Name = "terraform"
    }
}

#aws_security_group
resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_ssh" #allow_ssh is already exists
  description = "Allow port number 22 for SSH access"

  tags = {
    Name = "allow_sssh"
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
