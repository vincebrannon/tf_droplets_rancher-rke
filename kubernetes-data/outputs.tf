output "rancher_url" {
  description = "Rancher cluster DNS"
  value       = "https://${var.rancher_dnsname}"
}

output "rke-custom_cluster_command" {
  value       = rancher2_cluster.rke-custom.cluster_registration_token.0.insecure_node_command
  description = "Docker command used to add a node to the rke-custom downstream cluster"
}

output "rke2_cluster_command" {
  value       = rancher2_cluster_v2.rke2.cluster_registration_token.0.insecure_node_command
  description = "Docker command used to add a node to the rke2 downstream cluster"
}
