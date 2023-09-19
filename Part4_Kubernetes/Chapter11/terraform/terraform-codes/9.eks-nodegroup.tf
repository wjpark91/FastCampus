resource "aws_eks_node_group" "ahntest2-eks-nodegroup" {

    cluster_name = aws_eks_cluster.ahntest2-eks-cluster.name
    node_group_name = "ahntest2-eks-nodegroup"
    node_role_arn = aws_iam_role.ahntest2-eks_iam_nodes.arn
    subnet_ids = aws_subnet.ahntest2-public-subnet[*].id

    ami_type = "AL2_x86_64"
    capacity_type = "ON_DEMAND"
    instance_types = ["t3a.medium"]
    disk_size = 20

    scaling_config {
      desired_size = 2
      max_size = 3
      min_size = 1
    }

    depends_on = [
        aws_iam_role_policy_attachment.ahntest2-eks_iam_cluster_AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.ahntest2-eks_iam_cluster_AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.ahntest2-eks_iam_cluster_AmazonEC2ContainerRegistryReadOnly
    ]

    tags = {
      "Name" = "AHNTEST2-EKS-WORKER-NODES"
    }
}
