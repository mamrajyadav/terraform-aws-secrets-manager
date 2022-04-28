variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-aws-secrets-manager"
  description = "Terraform current module repo"
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'"
}

variable "kms_key_id" {
  default     = null
  description = "The KMS Key ID to encrypt the secret."
}

variable "policy" {
  type        = string
  default     = null
  description = "The resource policy which controls access to the secret."
}

variable "name" {
  type        = string
  description = "Name of secret to store"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "User-Defined tags"
}

variable "value" {
  type        = string
  description = "Secret value to store"
}

variable "recovery_window_in_days" {
  type        = number
  default     = 15
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days.The default value is 30."
}

variable "enable" {
  type    = bool
  default = true
}

variable "secretsmanager-enabled" {
  type    = bool
  default = true
}
