####################
# General          #
####################

variable "tags" {
  description = "(Optional) Any custom tags that should be added to all of the resources."
  type        = map(string)
  default     = {}
}

variable "zone_name" {
  description = "(Required) The existing AWS Route53 zone to use. If using the base infrastructure, the value can be accessed via the `zone_name` output."
  type        = string
  default     = "tf-support.hashicorpdemo.com"
}

variable "namespace" {
  type    = string
  default = "terraform-enterprise"
}

####################
# EKS              #
####################

variable "instance_type" {
  description = "Instance type for the EKS managed node group"
  type        = list(string)
  default     = ["t3a.2xlarge"]
}

variable "kubernetes_version" {
  type = string
  # renovate: datasource=endoflife-date depName=amazon-eks versioning=loose
  default = "1.28"
}

variable "helm_chart_version" {
  type = string
  # renovate: helm: registryUrl=https://helm.releases.hashicorp.com depName=terraform-enterprise
  default = "1.1.1"
}

####################
# Postgres         #
####################

variable "postgresql_version" {
  type = string
  # renovate: datasource=endoflife-date depName=amazon-rds-postgresql versioning=loose
  default = "15.5"
}

variable "db_instance_size" {
  type    = string
  default = "db.t3.small"
}

variable "db_port" {
  type    = string
  default = "5432"
}

####################
# Redis            #
####################

variable "redis_use_password_auth" {
  description = "(Optional) Whether or not to use password authentication when connecting to Redis."
  type        = bool
  default     = true
}

variable "redis_use_tls" {
  description = "(Optional) Whether or not to use TLS when connecting to Redis."
  type        = bool
  default     = true
}

variable "redis_port" {
  type    = string
  default = "6379"
}

####################
# TFE Settings     #
####################

variable "node_count" {
  description = "(Optional) The number of pods when using active-active."
  type        = number
  default     = 1
}

variable "encryption_password" {
  type    = string
  default = "SUPERSECRET"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

####################
# Docker Registry  #
####################

variable "docker_registry" {
  type        = string
  default     = "images.releases.hashicorp.com"
  description = "Appending of /hashicorp needed to registry URL for Docker to succesfully pull image via Terraform."
}

variable "image" {
  type    = string
  default = "hashicorp/terraform-enterprise"
}

variable "tag" {
  type        = string
  description = "Currently no latest tag available and must be manually set on workspace creation."
  # renovate: datasource=docker depName=images.releases.hashicorp.com/hashicorp/terraform-enterprise registryUrl=https://images.releases.hashicorp.com versioning=loose
  default = "v202312-1"
}

variable "docker_registry_username" {
  type    = string
  default = "terraform"
}

variable "tfe_license" {
  type        = string
  default     = "REDACTED"
  description = "License URL https://license.hashicorp.services/customers/7f3e3c93-0677-dafa-f3b4-8ee6c7fdf8d1"
}
