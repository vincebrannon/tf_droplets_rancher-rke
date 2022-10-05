resource "rke_cluster" "local-rancher" {
  
  dynamic "nodes" {
    for_each    = var.rancher-all
    content {
      address   = nodes.value.ipv4_address
      user      = var.user
      role      = ["controlplane", "worker", "etcd"]
      ssh_key   = var.priv-key_pem
    }
  }
  dynamic "nodes" {
    for_each    = var.rancher-etcd
    content {
      address   = nodes.value.ipv4_address
      user      = var.user
      role      = ["etcd"]
      ssh_key   = var.priv-key_pem
    }
  }
  dynamic "nodes" {
    for_each    = var.rancher-cp
    content {
      address   = nodes.value.ipv4_address
      user      = var.user
      role      = ["controlplane"]
      ssh_key   = var.priv-key_pem
    }
  }
  dynamic "nodes" {
    for_each    = var.rancher-worker
    content {
      address   = nodes.value.ipv4_address
      user      = var.user
      role      = ["worker"]
      ssh_key   = var.priv-key_pem
    }
  }

  cluster_name          = "local-rancher"
  ignore_docker_version = true
  kubernetes_version    = var.rancher_kubernetes_version
  

  cluster_yaml          = var.use_cluster_yaml == true ? file("./rancher-cluster.yaml") : ""
}

resource "local_file" "rancher_kube_cluster_yaml" {
  filename      = "./kubeconfig_rke_local-rancher.yml"
  content       = rke_cluster.local-rancher.kube_config_yaml

  provisioner "local-exec" {
    command = "rm -f ./kubeconfig_rke_local-rancher.yml && rm -f local-rancher_rke.log"
    when    = destroy
  }
}
