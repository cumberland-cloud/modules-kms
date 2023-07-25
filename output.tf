output "key" {
    value       = {
        id      = aws_kms_key.this.key_id
        arn     = aws_kms_key.this.arn
    }
}