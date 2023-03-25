variable "aws_region" {
    description = "AWS region"
    type        = string
}

variable "secret_description" {
  description = "Description of the secret"
  type        = string
  default     = null
}

variable "secret_name" {
  description = "Name of the secret"
  type        = string
  default     = null
}
