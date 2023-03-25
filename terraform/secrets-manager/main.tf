terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "4.45.0"
        }
    }
    required_version = "~> 1.4.0"
}

provider "aws" {
    region = var.aws_region
}

#######################################
# Secrets Manager, secret.json is generated from terraform GHA workflow
# (by calling terraform reusable workflow), which extracts the github environment secrets
# into secret.json, persisted at the terraform working directory, retrieved here through
# templatefile function to persist into AWS secrets manager.
#######################################
resource "aws_secretsmanager_secret" "secret" {
    count = var.secret_name != null ? 1 : 0
    description = var.secret_description
    name        = var.secret_name
}

resource "aws_secretsmanager_secret_version" "secret_version" {
    count = var.secret_name != null ? 1 : 0
    secret_id = aws_secretsmanager_secret.secret[0].id
    secret_string = templatefile("${path.root}/secret.json", {})
}
