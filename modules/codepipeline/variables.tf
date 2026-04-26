variable "pipeline_name" {
  description = "Name of the pipeline"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "artifact_bucket_name" {
  description = "Name of the S3 bucket for artifacts"
  type        = string
}

variable "github_repo_id" {
  description = "GitHub Repository ID (e.g., owner/repo)"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch name"
  type        = string
  default     = "main"
}

variable "codebuild_project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "github_oauth_token" {
  description = "GitHub OAuth Token with repo access"
  type        = string
  sensitive   = true
}
