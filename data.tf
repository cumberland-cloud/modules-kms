data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "merged" {
    count                   = local.merge ? 1 : 0

    source_policy_documents = [
        aws_iam_policy_document.unmerged.json,
        var.key.policy
    ]
}

data "aws_iam_policy_document" "unmerged" {
  #checkov:skip=CKV_AWS_356: "Ensure no IAM policies documents allow "*" as a statement's resource for restrictable actions"
    # NOTE: kms:* is the default policy. Explicit denies can be merged in through the `var.key.policy` variable.
  
  statement {
    sid                     = "EnableIAMPerms"
    effect                  = "Allow"
    actions                 = [ "kms:*" ]
    resources               = [ "*" ]

    principals {
      type        =  "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }
  }
}