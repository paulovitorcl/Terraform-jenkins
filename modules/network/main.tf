resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.name}-vpc"
  }
}


## Public configuration 

# Public subnet 

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}-${var.availability_zones}-public"
  }
}

# IGW - This will be used by the public subnet 
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.name}-igw"
  }
}

# Public subnet route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "${var.name}-rt-internet"
  }
}

# Associate the public route table to public subnet 
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Public Security Groups - SG 

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "public" {
  name        = "${var.name}-public-sg"
  description = "Public security group to allow inbound/outbound from the public connection"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    iterator = port
    for_each = var.public_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
      description = "My outside Public IP"
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Default outbound traffic for public subnet"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.name}-public-sg"
  }
}














