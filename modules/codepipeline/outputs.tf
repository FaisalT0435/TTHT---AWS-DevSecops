output "pipeline_id" {
  value = aws_codepipeline.main.id
}

output "artifact_bucket_arn" {
  value = aws_s3_bucket.artifacts.arn
}
