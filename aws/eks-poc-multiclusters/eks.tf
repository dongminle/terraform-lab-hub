module "blue_eks_cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "uplus-blue-eks-cluster"
  cluster_version = "1.31"
  cluster_addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni    = {}
  }

  # Optional
  cluster_endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = data.aws_vpc.uplus.id
  subnet_ids               = [data.aws_subnet.pria.id, data.aws_subnet.pric.id]
  control_plane_subnet_ids = [data.aws_subnet.puba.id, data.aws_subnet.pubc.id]

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["m7g.large", "m6g.large", "c7g.large", "c6g.large"]
  }

  eks_managed_node_groups = {
    example = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_ARM_64_STANDARD"
      instance_types = ["m7g.large"]

      min_size     = 0
      max_size     = 3
      desired_size = 0
    }
  }

  tags = {
    "Owner"            = "dongminlee",
    "TerraformManaged" = "true",
    "Environment"      = "dev",
    "Project"          = "uplus"
  }
}

data "aws_eks_cluster_auth" "blue" {
  name = module.blue_eks_cluster.cluster_name
}
