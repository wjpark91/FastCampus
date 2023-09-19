resource "aws_eks_cluster" "ahntest2-eks-cluster" {

    depends_on = [
        aws_iam_role_policy_attachment.ahntest2-eks_iam_cluster_AmazonEKSClusterPolicy,
        aws_iam_role_policy_attachment.ahntest2-eks_iam_cluster_AmazonEKSVPCResourceController
    ]

    name = var.cluster-name
    role_arn = aws_iam_role.ahntest2-eks_iam_cluster.arn
    version = "1.26"

    vpc_config{
        security_group_ids = [aws_security_group.ahntest2-eks_sg_controlplane.id, aws_security_group.ahntest2-eks_sg_nodes.id]
        subnet_ids = flatten([aws_subnet.ahntest2-public-subnet[*].id])
        endpoint_public_access = true
        public_access_cidrs = ["0.0.0.0/0"]
    }

    tags = {
        "Name" = "AHNTEST2-EKS-CLUSTER"
    }
}