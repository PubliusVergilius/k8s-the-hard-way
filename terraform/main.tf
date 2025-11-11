data "aws_ami" "debian12" {
 most_recent = true 

 owners = [ "136693071363" ]
  
  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }
} 

resource "aws_key_pair" "admin-kp" {
  key_name = "admin-key" 
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID1vjeUzNimPyk7b5Iu/CP3qHMIfI7s6h2rlivqRX9S2 vini@fedora"
}

resource "aws_instance" "master" {
  instance_type = "t2.micro"
  ami = data.aws_ami.debian12.id 
  security_groups = [aws_security_group.allow_http.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.admin-kp.key_name 
  subnet_id = aws_subnet.private.id

  tags = {
    Name = "master"
  }

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<-EOF
    #!/bin/bash
    hostnamectl set-hostname master 
  EOF
}


resource "aws_instance" "worker1" {
  instance_type = "t2.micro"
  ami = data.aws_ami.debian12.id # Debian 13
  security_groups = [aws_security_group.allow_http.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.admin-kp.key_name 
  subnet_id = aws_subnet.private.id

  tags = {
    Name = "worker1"
  }

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<-EOF
    #!/bin/bash
    hostnamectl set-hostname worker1
  EOF
}


resource "aws_instance" "worker2" {
  instance_type = "t2.micro"
  ami = data.aws_ami.debian12.id 
  security_groups = [aws_security_group.allow_http.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.admin-kp.key_name 
  subnet_id = aws_subnet.private.id

  tags = {
    Name = "worker2"
  }

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<-EOF
    #!/bin/bash
    hostnamectl set-hostname worker2 
  EOF
}
