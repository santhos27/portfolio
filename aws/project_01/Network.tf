#--NETWORK--
#----------------vpc-------------------------

resource "aws_vpc" "vpc_01" {
  cidr_block    =   "192.168.20.0/24"
  instance_tenancy  =   "default"

    tags ={
      Name    =   "vpc_01"
    }
}

#---------public subnet 1a---------


resource "aws_subnet" "subnet_01" {
  vpc_id     = aws_vpc.vpc_01.id
  cidr_block = "192.168.20.0/26"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet_01"
  }
}

#--ROUTER--
#----------------internet getway---------------------

resource "aws_internet_gateway" "igw_01" {
  vpc_id = aws_vpc.vpc_01.id
  tags = {
    Name = "igw_01"
  }
}

#----------------route table---------------------

resource "aws_route_table" "route_table_01" {
  vpc_id = aws_vpc.vpc_01.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_01.id
  }
  tags = {
    Name = "route-table-01"
  }
}

#------------route table association for public subnet-----------------


resource "aws_route_table_association" "route_table_association_01" {
  subnet_id = aws_subnet.subnet_01.id
  route_table_id = aws_route_table.route_table_01.id
}



#--FIREWALL--
#----------------security group-------------------------


# Create a security group for the web server

resource "aws_security_group" "server_sg_01" {
  name_prefix = "server-sg"
  vpc_id = aws_vpc.vpc_01.id
  tags = {
    Name = "server_sg_01"
  }
# Allow inbound traffic (ingress)
  ingress {
    description = "Http protocol"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  ingress {
    description = "ssh protocol"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "rdp protocol"
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Allow all outbound traffic (egress)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # "-1" represents all protocols
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic to all destinations (0.0.0.0/0)
  }

