resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Permitir SSH e HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0abcdef1234567890"  
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "devsecops-ec2"
  }
}