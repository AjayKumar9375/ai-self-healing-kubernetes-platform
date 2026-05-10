variable "aws_region" {
  description = "AWS region for the platform."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name prefix for platform resources."
  type        = string
  default     = "self-healing"
}

variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
  default     = "self-healing-eks"
}

variable "cluster_version" {
  description = "Optional EKS Kubernetes version. Leave null to let AWS choose the default supported version."
  type        = string
  default     = null
}

variable "node_instance_types" {
  description = "EC2 instance types for EKS managed nodes."
  type        = list(string)
  default     = ["t3.medium"]
}
