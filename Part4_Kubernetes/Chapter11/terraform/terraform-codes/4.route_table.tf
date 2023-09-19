resource "aws_route_table" "ahntest2-route-table-pub-sub" {

  depends_on = [
    aws_vpc.ahntest2-vpc,
    aws_internet_gateway.ahntest2-internet-gateway
  ]

  vpc_id = aws_vpc.ahntest2-vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.ahntest2-internet-gateway.id
  }

  tags = {
    Name = "ahntest2-route-table-pub-sub"
  }

}