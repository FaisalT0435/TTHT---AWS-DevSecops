output "project_id" {
  value = aws_codebuild_project.main.id
}

output "project_name" {
  value = aws_codebuild_project.main.name
}

output "role_arn" {
  value = aws_iam_role.codebuild.arn
}
