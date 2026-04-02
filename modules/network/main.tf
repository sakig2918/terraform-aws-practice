resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "this"{
  vpc_id = aws_vpc.this.id

  cidr_block = var.subnet_cidr

  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet_name
  }
}

resource "aws_internet_gateway" "this"{
 vpc_id = aws_vpc.this.id

 tags = {
  Name = var.vpc_name
 }
}

 resource  "aws_route_table" "this"{
  vpc_id = aws_vpc.this.id
  
  tags = {
    Name = var.vpc_name
  }
 }
 # Route (インターネット向け)
resource "aws_route" "this" {
  route_table_id = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.this.id
}

# Subnetと関連付け
resource "aws_route_table_association" "this" {
  subnet_id = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}