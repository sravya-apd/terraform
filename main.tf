provider "aws" {
region = "us-east-2"
}


data "aws_ami" "ubuntu" {
  most_recent      = true
  name_regex       = "^gagan*"
  owners           = ["self"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
