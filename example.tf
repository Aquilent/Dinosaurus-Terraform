
resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.nano"
  key_name      = "PECOS-devtools"
  tags {
    "ChargeCode" = "C3001.002.001"
    "Name"       = "Neil's CDC test instance 1"
  }
}
