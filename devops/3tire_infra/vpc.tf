#---------VPC - 2public & 2 Private subnets on mumbai regon-------

resource "aws_vpc" "demovpc" {
  cidr_block    =   "192.168.10.0/24"
  instance_tenancy  =   "default"

    tags ={
        name    =   "demovpc"
    }
}


##----------------PUBLIC AREA----------------

#---------public subnet 1a---------


resource "aws_subnet" "public_subnet_1a" {
  vpc_id     = aws_vpc.demovpc.id
  cidr_block = "192.168.10.0/26"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_1a"
  }
}


#---------public subnet 1b---------


resource "aws_subnet" "public_subnet_1b" {
  vpc_id     = aws_vpc.demovpc.id
  cidr_block = "192.168.10.64/26"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_1b"
  }
}


#----------------internet getway---------------------


resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.demovpc.id
  tags = {
    Name = "my-igw"
  }
}

#----------------route table---------------------


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.demovpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}


#------------route table association for public subnet-----------------


resource "aws_route_table_association" "public_route_table_association" {
subnet_id = [ aws_subnet.public_subnet_1a.id , aws_subnet.public_subnet_1b.id ]
  route_table_id = aws_route_table.public_route_table.id
}


##----------------PRIVATE AREA----------------


#---------private subnet 1a---------


resource "aws_subnet" "private_subnet_1a" {
  vpc_id     = aws_vpc.demovpc.id
  cidr_block = "192.168.10.129/26"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "private_subnet_1a"
  }
}

#------------------------------------------------

#-----------eip for private subnet------------
resource "aws_eip" "nat_eip" {
  tags = {
    Name = "nat-eip"
  }
}

#-----------nat for private subnet------------
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_subnet_1a.id
  depends_on = [
    aws_internet_gateway.my_igw
  ]
  tags = {
    Name = "nat-gateway"
  }
}

#----------------route table---------------------


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.demovpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "private-route-table"
  }
}


#------------route table association for private subnet-----------------


resource "aws_route_table_association" "private_route_table_association" {
  subnet_id = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_route_table.id
}


#----------------security group-------------------------


# Create a security group for the web server
resource "aws_security_group" "web_server_sg" {
  name_prefix = "web-server-sg"
  vpc_id = aws_vpc.demovpc.id

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
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-server-sg"
  }
}
