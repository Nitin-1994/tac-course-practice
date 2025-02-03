resource "aws_instance" "lesson-5" {
  ami                    = "ami-0b7207e48d1b6c06f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http.id, aws_security_group.https.id, aws_security_group.ssh.id]
  key_name               = "nits_key"


  tags = {
    Name = "Lesson-5"
  }
}

resource "aws_key_pair" "nit_key" {
  key_name   = "nits_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTHao52mbqvM6UtPKDlB5E7sHde79+9Lfhu/272eA2a nsati@nitinsati-mac"
}

resource "aws_security_group" "https" {
  # ... other configuration ...
  name = "nit_https"
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "ssh" {
  # ... other configuration ...
  name = "nit_ssh"
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


resource "aws_security_group" "http" {
  # ... other configuration ...
  name = "nit_http"
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

