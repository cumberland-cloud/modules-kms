variable "key" {
    description     = "KMS Key configuration. Policy should be JSON string, and is applied in addition to the default KMS policy."
    type            = object({
        alias       = string
        admin       = optional(string, "admin")
        description = optional(string, null)
        policy      = optional(string, null)
    })
}