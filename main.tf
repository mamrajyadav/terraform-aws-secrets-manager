module "labels" {
  source  = "clouddrove/labels/aws"
  version = "0.15.0"

  name        = var.name
  environment = var.environment
  repository  = var.repository
  managedby   = var.managedby
  label_order = var.label_order
}

resource "aws_secretsmanager_secret" "secret" {
  count =  var.enable && var.secretsmanager-enabled ? 1 : 0

  kms_key_id              = var.kms_key_id
  name                    = var.name
  policy                  = var.policy
  recovery_window_in_days = var.recovery_window_in_days

  tags = module.labels.tags
}

resource "aws_secretsmanager_secret_version" "secret" {
  count         = var.enable && var.secretsmanager-enabled ? 1 : 0
  secret_id     = join("", aws_secretsmanager_secret.secret.*.id)
  secret_string = var.value

}