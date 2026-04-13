resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_1"{
  vpc_id = aws_vpc.this.id
  cidr_block = var.subnet_1_cidr
  availability_zone = var.subnet_1_az
  map_public_ip_on_launch = true
  
  tags = {
    Name = var.subnet_1_name
  }
}

resource "aws_subnet" "public_2" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.subnet_2_cidr
  availability_zone = var.subnet_2_az
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_2_name
  }
}

resource "aws_internet_gateway" "this"{
 vpc_id = aws_vpc.this.id

 tags = {
  Name = "${var.vpc_name}-igw"
 }
}

 resource  "aws_route_table" "this"{
  vpc_id = aws_vpc.this.id
  
  tags = {
    Name = "${var.vpc_name}-rt"
  }
 }
 # Route (インターネット向け)
resource "aws_route" "this" {
  route_table_id = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.this.id
}

# Subnetと関連付け
resource "aws_route_table_association" "public_1" {
  subnet_id = aws_subnet.public_1.id
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id = aws_subnet.public_2.id
  route_table_id = aws_route_table.this.id
}