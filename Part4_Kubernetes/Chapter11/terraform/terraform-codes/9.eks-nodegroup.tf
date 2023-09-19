resource "aws_eks_node_group" "pwj-eks-nodegroup" {

    cluster_name = aws_eks_cluster.pwj-eks-cluster.name
    node_group_name = "pwj-eks-nodegroup"
    node_role_arn = aws_iam_role.pwj-eks_iam_nodes.arn
    subnet_ids = aws_subnet.pwj-public-subnet[*].id

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
        aws_iam_role_policy_attachment.pwj-eks_iam_cluster_AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.pwj-eks_iam_cluster_AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.pwj-eks_iam_cluster_AmazonEC2ContainerRegistryReadOnly
    ]

    tags = {
      "Name" = "PWJ-EKS-WORKER-NODES"
    }
}
