variable "cluster_name" {
  description = "Name of the EKS cluster"
}

variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
}

variable "subnet_ids" {
  description = "Subnet IDs for the EKS cluster"
}

variable "node_group_name" {
  description = "Name of the EKS node group"
}
