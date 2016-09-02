provider "aws" {
  access_key = "AKIAJQXUGU6Z42CFSGNQ"
  secret_key = "TKpWZTk8Hc10uJNo8VqTOtdG3cYO0/W9NJG0yG6P"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.nano"
}