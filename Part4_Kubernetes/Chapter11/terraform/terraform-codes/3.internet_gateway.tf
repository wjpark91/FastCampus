resource "aws_internet_gateway" "ahntest2-internet-gateway" {

  depends_on = [
    aws_vpc.ahntest2-vpc
  ]

  vpc_id = aws_vpc.ahntest2-vpc.id

  tags = {
    Name = "ahntest2-internet-gateway"
  }
}
