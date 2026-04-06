locals {
<<<<<<< HEAD
  region = "eu-west-1"
  name   = "tws-eks-cluster"

  vpc_cidr = "10.0.0.0/16"
  azs      = ["eu-west-1a", "eu-west-1b"]

  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  intra_subnets   = ["10.0.5.0/24", "10.0.6.0/24"]

  tags = {
    example = "tws-eks"
  }
}

provider "aws" {
  region = local.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67"
    }
  }
}
=======

  region          = "eu-west-1"
  name            = "tws-eks-cluster"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["eu-west-1a", "eu-west-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  intra_subnets   = ["10.0.5.0/24", "10.0.6.0/24"]
  tags = {
    example = local.name
  }

}

provider "aws" {

  region = local.region

}
>>>>>>> 562b6fa6b5687c5f2d6bb3fb36717fb0ee002bdf
