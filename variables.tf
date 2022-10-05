## Define variables
variable "do_token" {
  default = ""
}
variable "prefix" {
  default = ""
}

variable "region_server" {
  default = ""
}

variable "rancher_all_roles_nodes" {
  default = ""
}

variable "rancher_etcd_nodes" {
  default = ""
}

variable "rancher_cp_nodes" {
  default = ""
}

variable "rancher_worker_nodes" {
  default = ""
}

variable "rancher_kubernetes_version" {
  default = ""
}

variable "docker_version" {
  default = ""
}

variable "use_cluster_yaml" {
  type = bool
  default = false
}

variable "cert_manager_version" {
  default = ""
}

variable "rancher_version" {
  default = ""
}

variable "rancher_password" {
  default = ""
}

variable "downstream_all_roles_nodes" {
  default = ""
}

variable "downstream_etcd_nodes" {
  default = ""
}

variable "downstream_cp_nodes" {
  default = ""
}

variable "downstream_worker_nodes" {
  default = ""
}

variable "downstream_kubernetes_version" {
  default = ""
}

variable "rke2_all_roles_nodes" {
  default = ""
}

variable "rke2_etcd_nodes" {
  default = ""
}

variable "rke2_cp_nodes" {
  default = ""
}

variable "rke2_worker_nodes" {
  default = ""
}

variable "rke2_kubernetes_version" {
  default = ""
}

variable "size" {
  default = ""
}
variable "nodes_image" {
  default = ""
}

variable "user" {
  default = "root"
}

data "digitalocean_account" "do-account" {
}
