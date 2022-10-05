output "nodes_private-key" {
  description = "SSH private key to connect to the nodes"
  value       = nonsensitive(tls_private_key.priv-key.private_key_pem)
}

# Rancher cluster
output "rancher_all-roles_nodes-address" {
  description = "Rancher cluster nodes IP with all roles"
  value       = digitalocean_droplet.rancher-all[*].ipv4_address
}
output "rancher_etcd_nodes-address" {
  description = "Rancher cluster nodes IP with ETCD role only"
  value       = digitalocean_droplet.rancher-etcd[*].ipv4_address
}
output "rancher_cp_nodes-address" {
  description = "Rancher cluster nodes IP with ControlPlane role only"
  value       = digitalocean_droplet.rancher-cp[*].ipv4_address
}
output "rancher_worker_nodes-address" {
  description = "Rancher cluster nodes IP with worker role"
  value       = digitalocean_droplet.rancher-worker[*].ipv4_address
}

# RKE downstream cluster
output "rke-custom_all-roles_nodes-address" {
  description = "RKE custom cluster nodes IP with all roles"
  value       = digitalocean_droplet.downstream-all[*].ipv4_address
}
output "rke-custom_etcd_nodes-address" {
  description = "RKE custom cluster nodes IP with ETCD role only"
  value       = digitalocean_droplet.downstream-etcd[*].ipv4_address
}
output "rke-custom_cp_nodes-address" {
  description = "RKE custom cluster nodes IP with ControlPlane role only"
  value       = digitalocean_droplet.downstream-cp[*].ipv4_address
}
output "rke-custom_worker_nodes-address" {
  description = "RKE custom cluster nodes IP with worker role"
  value       = digitalocean_droplet.downstream-worker[*].ipv4_address
}

# RKE2 downstream cluster
output "rke2_all-roles_nodes-address" {
  description = "RKE2 cluster nodes IP with all roles"
  value       = digitalocean_droplet.rke2-all[*].ipv4_address
}
output "rke2_etcd_nodes-address" {
  description = "RKE2 cluster nodes IP with ETCD role only"
  value       = digitalocean_droplet.rke2-etcd[*].ipv4_address
}
output "rke2_cp_nodes-address" {
  description = "RKE2 cluster nodes IP with ControlPlane role only"
  value       = digitalocean_droplet.rke2-cp[*].ipv4_address
}
output "rke2_worker_nodes-address" {
  description = "RKE2 cluster nodes IP with worker role"
  value       = digitalocean_droplet.rke2-worker[*].ipv4_address
}


output "zzz_rancher_url" {
  description = "Rancher cluster DNS"
  value       = module.kubernetes_data.rancher_url
}
