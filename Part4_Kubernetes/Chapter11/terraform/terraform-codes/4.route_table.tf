resource "aws_route_table" "pwj-route-table-pub-sub" {

  depends_on = [
    aws_vpc.pwj-vpc,
    aws_internet_gateway.pwj-internet-gateway
  ]

  vpc_id = aws_vpc.pwj-vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.pwj-internet-gateway.id
  }

  tags = {
    Name = "pwj-route-table-pub-sub"
  }

}