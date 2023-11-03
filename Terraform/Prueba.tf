provider "aws" {
  region = "us-east-2" 
}

resource "aws_instance" "default" {
  ami           = "ami-0e83be366243f524a" 
  instance_type = "t2.micro"             
  key_name      = "Prueba"
  security_groups = [aws_security_group.115.id]
  subnet_id = "subnet-0861112d91f2dccaa"

    tags = {
      Name = "935"
    }
}
	output "My_ip"{
           value = aws_instance.default.public_ip
           }
           
resource "aws_security_group" "115" {
  name        = "allow-ssh-http"
  description = "Security Group para SSH y HTTP"

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
  
    ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  
    ingress {
    from_port   = 9090
    to_port     = 9090
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
