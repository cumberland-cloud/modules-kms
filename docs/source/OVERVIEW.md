# Terraform Modules: KMS

[![terraform workflows](https://github.com/cumberland-cloud/modules-kms/actions/workflows/action.yaml/badge.svg)](https://github.com/cumberland-cloud/modules-kms/actions/workflows/action.yaml)

[![pages-build-deployment](https://github.com/cumberland-cloud/modules-kms/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/cumberland-cloud/modules-kms/actions/workflows/pages/pages-build-deployment)

This module is maintained as part of the open-source [cumberland-cloud Github project](). This module is simple and straightforward. It will provision a **AWS KMS** key with a default policy that allows the administrator full read-write access to the key and all **IAM** users in the caller account to use the key for standard cryptographic operations. Additional statements can be merged into this default policy by passing in a secondary policy document. See table below for more information.