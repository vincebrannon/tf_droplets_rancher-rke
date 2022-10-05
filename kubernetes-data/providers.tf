# Configure RKE provider
provider "rke" {
  log_file = "local-rancher_rke.log"
}

# Configure Helm release provider
provider "helm" {
  kubernetes {
    config_path = "./kubeconfig_rke_local-rancher.yml"
  }
}

# Rancher2 bootstrapping provider
provider "rancher2" {
  alias = "bootstrap"

  api_url  = "https://${var.rancher_dnsname}"
  insecure = false
  bootstrap = true
}

# Rancher2 administration provider
provider "rancher2" {
  alias = "admin"

  api_url  = "https://${var.rancher_dnsname}"
  insecure = false
  token_key = rancher2_bootstrap.admin.token
  timeout   = "300s"
}
