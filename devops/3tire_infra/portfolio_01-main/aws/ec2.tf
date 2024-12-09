resource "aws_instance" "webserver_01" {
    ami = "ami-053b12d3152c0cc71"
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.public_subnet_1a.id
    security_groups = [aws_security_group.web_server_sg.id]
    tags = {
      Name = "webserver_01"
      key_name      = "AWS_27_07"
  }
  
}

resource "aws_instance" "webserver_02" {
    ami = "ami-053b12d3152c0cc71"
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.public_subnet_1b.id
    security_groups = [aws_security_group.web_server_sg.id]
    tags = {
      Name = "webserver_02"
      key_name      = "AWS_27_07"
  }
  
}

resource "aws_instance" "database_server_01" {
    ami = "ami-053b12d3152c0cc71"
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.private_subnet_1a.id
    security_groups = [aws_security_group.web_server_sg.id]
    tags = {
      Name = "database_server_01"
      key_name      = "AWS_27_07"
  }
  
}

resource "aws_instance" "database_server_02" {
    ami = "ami-053b12d3152c0cc71"
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.private_subnet_1b.id
    security_groups = [aws_security_group.web_server_sg.id]
    tags = {
      Name = "database_server_02"
      key_name      = "AWS_27_07"
  }
  
}
