# ECS Module
Provisioning of ECS Cluster and Fargate Services.

## Features
- ECS Cluster with Container Insights enabled.
- Task Definitions with CloudWatch logging.
- Service deployment within private subnets.
- IAM roles for task execution.

## Inputs
| Name | Description | Default |
|------|-------------|---------|
| name | Service name | n/a |
| vpc_id | VPC ID | n/a |
| container_image | Docker image URI | n/a |

## Outputs
- `cluster_id`: ID of the ECS cluster.
- `service_name`: Name of the ECS service.
