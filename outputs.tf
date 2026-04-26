output "alb_url" {
  description = "URL of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_id
}
