resource "aws_instance" "webserver" {
    ami = "ami-02eb7a4783e7e9317"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1a"
    subnet_id     = aws_subnet.public_subnet_1a.id
    security_groups = [aws_security_group.web_server_sg.id]
    tags = {
      Name = "webserver"
      key_name = "/home/jarvis/Downloads/insta_key.pem"
  }
  
}

resource "aws_instance" "webserver" {
    ami = "ami-02eb7a4783e7e9317"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1b"
    subnet_id     = aws_subnet.public_subnet_1b.id
    security_groups = [aws_security_group.web_server_sg.id]
    tags = {
      Name = "webserver"
      key_name = "/home/jarvis/Downloads/insta_key.pem"
  }
  
}

resource "aws_instance" "database_server" {
    ami = "ami-02eb7a4783e7e9317"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1a"
    subnet_id     = aws_subnet.private_subnet_1a.id
    security_groups = [aws_security_group.web_server_sg.id]
    tags = {
      Name = "database_server"
      key_name = "/home/jarvis/Downloads/insta_key.pem"
  }
  
}

resource "aws_instance" "database_server" {
    ami = "ami-02eb7a4783e7e9317"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1b"
    subnet_id     = aws_subnet.private_subnet_1b.id
    security_groups = [aws_security_group.web_server_sg.id]
    tags = {
      Name = "database_server"
      key_name = "/home/jarvis/Downloads/insta_key.pem"
  }
  
}
