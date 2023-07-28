# Terraform Modules: KMS

[![terraform workflows](https://github.com/cumberland-cloud/modules-kms/actions/workflows/action.yaml/badge.svg)](https://github.com/cumberland-cloud/modules-kms/actions/workflows/action.yaml)

[![pages-build-deployment](https://github.com/cumberland-cloud/modules-kms/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/cumberland-cloud/modules-kms/actions/workflows/pages/pages-build-deployment)

A Terraform module for deploying a KMS key and policy.

Refer to [hosted docs]() for more information regarding this module.

## TODOS
- fix CKV_AWS_109 and CKV_AWS_11 on `data.aws_iam_policy_document.unmerged`