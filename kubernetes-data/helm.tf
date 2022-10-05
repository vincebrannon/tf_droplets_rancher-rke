resource "helm_release" "cert_manager" {
  depends_on = [
    local_file.rancher_kube_cluster_yaml,
  ]

  name                = "cert-manager"
  chart               = "https://charts.jetstack.io/charts/cert-manager-v${var.cert_manager_version}.tgz"
  namespace           = "cert-manager"
  create_namespace    = true
  wait                = true

  set {
    name              = "installCRDs"
    value             = "true"
  }
}

resource "helm_release" "rancher_server" {
  depends_on = [
    helm_release.cert_manager,
  ]

  name                = "rancher"
  chart               = "https://releases.rancher.com/server-charts/stable/rancher-${var.rancher_version}.tgz"
  namespace           = "cattle-system"
  create_namespace    = true
  wait                = true

  set {
    name              = "hostname"
    value             = var.rancher_dnsname
  }
  set {
    name              = "replicas"
    value             = "3"
  }
  set {
    name              = "bootstrapPassword"
    value             = "admin"
  }
  set {
    name              = "ingress.tls.source"
    value             = "letsEncrypt"
  }
  set {
    name              = "letsEncrypt.email"
    value             = var.do_account-email
  }
  set {
    name              = "letsEncrypt.ingress.class"
    value             = "nginx"
  }
}
