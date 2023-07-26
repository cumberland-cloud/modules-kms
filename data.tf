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
  #checkov:skip=CKV_AWS_109: "Ensure IAM policies does not allow permissions management / resource exposure without constraints"
  #checkov:skip=CKV_AWS_111: "Ensure IAM policies does not allow write access without constraints"
    # NOTE for CKV_AWS_356: kms:* is the default policy. Explicit denies can be merged in through the 
    #     `var.key.policy` variable.
    # TODO: fix CKV_AWS_109 and CKV_AWS_11
  statement {
    sid                     = "EnableAdminPerms"
    effect                  = "Allow"
    actions                 = [ 
      "kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:TagResource",
      "kms:UntagResource",
      "kms:ScheduleKeyDeletion",
      "kms:CancelKeyDeletion"
    ]
    resources               = [ "*" ]

    principals {
      type                  =  "AWS"
      identifiers           = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${var.key.admin}",
      ]
    }
  }

  statement {
    sid                     = "EnableIAMPerms"
    effect                  = "Allow"
    actions                 = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources               = [ "*" ]

    principals {
      type                  =  "AWS"
      identifiers           = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
    }
  }
}