locals {
    merge       = var.key.policy != null
    policy      = local.merge ? data.aws_iam_policy_document.merged[0].json : data.aws_iam_policy_document.unmerged.json
}