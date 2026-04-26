variable "name" {
  description = "Name of the ALB"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "container_port" {
  description = "Port the container is listening on"
  type        = number
  default     = 80
}

variable "health_check_path" {
  description = "Path for the health check"
  type        = string
  default     = "/"
}
