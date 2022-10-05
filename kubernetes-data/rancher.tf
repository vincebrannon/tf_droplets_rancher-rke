# Initialize Rancher server
resource "rancher2_bootstrap" "admin" {
  depends_on = [
    helm_release.rancher_server
  ]

  provider = rancher2.bootstrap

  password  = var.rancher_password
  telemetry = false
}

# Init Downstream cluster
resource "rancher2_cluster" "rke-custom" {
  provider = rancher2.admin

  name               = "rke-custom"
  rke_config {
    kubernetes_version = var.downstream_kubernetes_version
  }
}

# Init downstream RKE2 cluster
resource "rancher2_cluster_v2" "rke2" {
  provider = rancher2.admin

  name = "rke2"
  kubernetes_version = var.rke2_kubernetes_version
}
