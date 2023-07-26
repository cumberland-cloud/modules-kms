resource "aws_kms_key" "this" {
  description               = var.key.description
  deletion_window_in_days   = 10
  enable_key_rotation       = true
  policy                    = local.policy
}

resource "aws_kms_alias" "this" {
  name                      = "alias/${var.key.alias}"
  target_key_id             = aws_kms_key.this.key_id
}