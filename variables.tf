variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-3"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "indico-faisal"
}

variable "github_repo_url" {
  description = "Full URL of the GitHub repository"
  type        = string
}

variable "github_repo_id" {
  description = "GitHub repository ID in format 'owner/repo'"
  type        = string
}

variable "github_oauth_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}
