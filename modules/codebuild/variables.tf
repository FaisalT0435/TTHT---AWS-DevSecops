variable "project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository URL"
  type        = string
}

variable "buildspec_path" {
  description = "Path to the buildspec file"
  type        = string
  default     = "buildspec.yml"
}

variable "compute_type" {
  description = "Compute type for CodeBuild"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "image" {
  description = "Docker image for CodeBuild"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
}

variable "environment_variables" {
  description = "Map of environment variables"
  type        = map(string)
  default     = {}
}
