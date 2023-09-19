resource "aws_route_table_association" "ahntest2-route-association-pub-sub" {

    count = length(var.aws_vpc_public_subnets)
    subnet_id = aws_subnet.ahntest2-public-subnet[count.index].id
    route_table_id = aws_route_table.ahntest2-route-table-pub-sub.id
    
}
