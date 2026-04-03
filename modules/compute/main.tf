#セキュリティグループ
resource "aws_security_group" "this" {
  name = "sample-sg"
  description = "allow ssh"
  vpc_id = var.vpc_id
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#EC2
resource "aws_instance" "this" {
  ami = "ami-088b486f20fab3f0e"
  instance_type = "t2.micro"
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.this.id]
  key_name = "test-ec2-key-1"

  user_data = <<-EOF
              #!/bin/bash
              dnf install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello Terraform" > /var/www/html/index.html
              EOF
              
  tags = {
    Name = var.instance_name
  }
}

