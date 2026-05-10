output "cluster_name" {
  value = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "sample_service_ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}

output "auto_healer_ecr_repository_url" {
  value = aws_ecr_repository.auto_healer.repository_url
}

