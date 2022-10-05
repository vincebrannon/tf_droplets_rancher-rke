module "kubernetes_data" {
  source = "./kubernetes-data"

  do_account-email              = data.digitalocean_account.do-account.email
  user                          = var.user
  priv-key_pem                  = tls_private_key.priv-key.private_key_pem

  rancher-all                   = digitalocean_droplet.rancher-all[*]
  rancher-etcd                  = digitalocean_droplet.rancher-etcd
  rancher-cp                    = digitalocean_droplet.rancher-cp
  rancher-worker                = digitalocean_droplet.rancher-worker

  rancher_kubernetes_version    = var.rancher_kubernetes_version
  use_cluster_yaml              = var.use_cluster_yaml

  cert_manager_version          = var.cert_manager_version
  rancher_version               = var.rancher_version
  rancher_dnsname               = "${local.rancherlb-record}.${local.rancherlb-domain}"

  rancher_password              = var.rancher_password
  downstream_kubernetes_version = var.downstream_kubernetes_version
  rke2_kubernetes_version       = var.rke2_kubernetes_version
}
