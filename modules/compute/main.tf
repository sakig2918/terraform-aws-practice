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
}

#EC2
resource "aws_instance" "this" {
  ami = "ami-088b486f20fab3f0e"
  instance_type = "t2.micro"
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.this.id]
  key_name = "test-ec2-key-1"
}

