variable "environment" {
  type        = "string"
  description = "name of environment level"
}

resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.nano"
  tags {
    "ChargeCode"   = "C3001.002.001"
    "Name"         = "Master instance"
    "Environment"  = "${var.environment}"
  }
}
