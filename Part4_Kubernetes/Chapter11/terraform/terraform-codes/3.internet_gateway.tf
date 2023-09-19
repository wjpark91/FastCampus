resource "aws_internet_gateway" "pwj-internet-gateway" {

  depends_on = [
    aws_vpc.pwj-vpc
  ]

  vpc_id = aws_vpc.pwj-vpc.id

  tags = {
    Name = "pwj-internet-gateway"
  }
}
