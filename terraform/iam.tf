resource "kubernetes_service_account" "eks_admin" {
  metadata {
    name      = "eks-admin"
    namespace = "kube-system"
  }
}

resource "aws_iam_role" "eks_admin_role" {
  name               = "EKSAdminRole"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.aws_account_id}:user/eks-admin"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}
