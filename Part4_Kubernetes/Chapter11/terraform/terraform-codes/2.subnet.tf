resource "aws_subnet" "ahntest2-public-subnet" {

  depends_on = [
    aws_vpc.ahntest2-vpc
  ]

  count = length(var.aws_vpc_public_subnets)
  vpc_id = aws_vpc.ahntest2-vpc.id
  cidr_block = var.aws_vpc_public_subnets[count.index]
  availability_zone = var.aws_azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name                                     = "ahntest2-public-subnet${count.index+1}"
    "kubernetes.io/cluster/ahntest2-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

}