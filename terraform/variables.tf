variable "namespace" {
    description = "The project namespace to use for unique resource naming"
    type = string
}

variable "region" {
    description = "AWS region"
    default = "us-east-1"
    type = string
}

variable "profile" {
    description = "AWS profile to be used"
    default = "default"
    type = string
}