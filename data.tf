data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "merged" {
    count                   = local.merge ? 1 : 0

    source_policy_documents = [
        aws_iam_policy_document.unmerged.json,
        var.key.policy
    ]
}

data "aws_iam_policy_document" "unmerged" {
  statement {
    sid                     = "EnableIAMPerms"
    effect                  = "Allow"
    actions                 = [ "kms:*" ]
    resources               = [ "*" ]

    principals {
      type        =  "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.account_id}:root"
      ]
    }
  }
}