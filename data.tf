data "aws_availability_zones" "available" {}
data "aws_caller_identity" "current" {}

data "terraform_remote_state" "base-infra" {
  backend = "remote"

  config = {
    organization = "hashicorp-support-eng"
    workspaces = {
      name = "terraform-team-base-infrastructure"
    }
  }
}

data "aws_route53_zone" "zone" {
  name = var.zone_name
}

data "aws_acm_certificate" "zone" {
  domain   = "*.${var.zone_name}"
  statuses = ["ISSUED"]
}

data "kubernetes_service" "tfe" {
  metadata {
    name      = "terraform-enterprise"
    namespace = "terraform-enterprise"
  }

  depends_on = [
    module.tfe-fdo-kubernetes
  ]
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}
