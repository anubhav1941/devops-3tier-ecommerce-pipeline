module "eks" {
<<<<<<< HEAD
=======

>>>>>>> 562b6fa6b5687c5f2d6bb3fb36717fb0ee002bdf
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.1"

  cluster_name                   = local.name
  cluster_endpoint_public_access = true

<<<<<<< HEAD
  create_kms_key = false
  cluster_encryption_config = []

=======
>>>>>>> 562b6fa6b5687c5f2d6bb3fb36717fb0ee002bdf
  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.public_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

<<<<<<< HEAD
  eks_managed_node_group_defaults = {
    instance_types = ["t2.large"]
  }

  eks_managed_node_groups = {
    default = {
      desired_size = 2
      min_size     = 1
      max_size     = 3
    }
  }

  tags = local.tags
}

=======
  # EKS Managed Node Group(s)

  eks_managed_node_group_defaults = {

    instance_types = ["t2.large"]

    attach_cluster_primary_security_group = true

  }


  eks_managed_node_groups = {

    tws-demo-ng = {
      min_size     = 2
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.large"]
      capacity_type  = "SPOT"

      disk_size = 35 
      use_custom_launch_template = false  # Important to apply disk size!

      tags = {
        Name = "tws-demo-ng"
        Environment = "dev"
        ExtraTag = "e-commerce-app"
      }
    }
  }
 
  tags = local.tags


}

data "aws_instances" "eks_nodes" {
  instance_tags = {
    "eks:cluster-name" = module.eks.cluster_name
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }

  depends_on = [module.eks]
}
>>>>>>> 562b6fa6b5687c5f2d6bb3fb36717fb0ee002bdf
