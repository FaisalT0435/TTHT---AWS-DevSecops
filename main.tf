terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Networking infrastructure
module "vpc" {
  source = "./modules/vpc"

  environment        = var.environment
  vpc_cidr           = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.10.0/24", "10.0.11.0/24"]
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b"]
}

# Application Load Balancer
module "alb" {
  source = "./modules/alb"

  name        = "${var.project_name}-alb"
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.public_subnet_ids
}

# ECS Compute resources
module "ecs" {
  source = "./modules/ecs"

  name                  = var.project_name
  environment           = var.environment
  region                = var.aws_region
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_subnet_ids
  container_image       = "nginx:latest"
  target_group_arn      = module.alb.target_group_arn
  alb_security_group_id = module.alb.alb_security_group_id
}

# CodeBuild for CI
module "codebuild" {
  source = "./modules/codebuild"

  project_name = "${var.project_name}-build"
  environment  = var.environment
  github_repo  = var.github_repo_url

  environment_variables = {
    CLUSTER_NAME = module.ecs.cluster_id
    SERVICE_NAME = module.ecs.service_name
  }
}

# CodePipeline for CD
module "codepipeline" {
  source = "./modules/codepipeline"

  pipeline_name          = "${var.project_name}-pipeline"
  environment            = var.environment
  artifact_bucket_name   = "${var.project_name}-artifacts-${var.environment}"
  github_repo_id         = var.github_repo_id
  github_oauth_token     = var.github_oauth_token
  codebuild_project_name = module.codebuild.project_name
  ecs_cluster_name       = module.ecs.cluster_id
  ecs_service_name       = module.ecs.service_name
}
