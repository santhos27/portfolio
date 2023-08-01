resource "aws_instance" "ubuntu" {
  ami           = "ami-08e5424edfe926b43"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_01.id
  security_groups = [aws_security_group.server_sg_01.id]
  key_name      = "AWS_27_07"
  
  tags = {
    Name = "ubuntu-20"
  }
}

resource "aws_instance" "RedHat" {
  ami           = "ami-008b85aa3ff5c1b02"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_01.id
  security_groups = [aws_security_group.server_sg_01.id]
  key_name      = "AWS_27_07"

  tags = {
    Name = "RedHat-9"
  }
}

resource "aws_instance" "windows2022" {
  ami           = "ami-0ff1768d0d7c69c2a"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_01.id
  security_groups = [aws_security_group.server_sg_01.id]
  key_name      = "AWS_27_07"

  tags = {
    Name = "Windows Server 2022 CORE"
  }
}