## Define variables

variable "do_account-email" {
  type        = string
  description = "DigitalOcean token user email address"
  default     = "toDelete"
}

variable "user" {
  type        = string
  description = "OS user used to boostrap nodes"
  default     = "root"
}

variable "priv-key_pem" {
  type        = string
  description = "Private key used for SSH access to the nodes"
  default     = ""
}

variable "rancher-all" {
  type        = list(object({
    id  = string
    ipv4_address = string
  }))
  description = "Rancher cluster droplets with ALL roles"
}

variable "rancher-etcd" {
  type        = list(object({
    id  = string
    ipv4_address = string
  }))
  description = "Rancher cluster droplets with ETCD roles"
}

variable "rancher-cp" {
  type        = list(object({
    id  = string
    ipv4_address = string
  }))
  description = "Rancher cluster droplets with CP roles"
}

variable "rancher-worker" {
  type        = list(object({
    id  = string
    ipv4_address = string
  }))
  description = "Rancher cluster droplets with WORKER roles"
}

variable "rancher_kubernetes_version" {
  type        = string
  description = "Rancher cluster Kubernetes version"
  default     = "v1.22.11-rancher1-1"
}

variable "use_cluster_yaml" {
  type        = bool
  description = "Set to true to extend Rancher cluster RKE config with a rancher-cluster.yaml file"
  default     = false
}

variable "cert_manager_version" {
  type        = string
  description = "Version of cert-manager to install alongside Rancher (format: 0.0.0)"
  default     = "1.7.1"
}

variable "rancher_version" {
  type        = string
  description = "Rancher server version (format 0.0.0)"
  default     = "2.6.8"
}

variable "rancher_password" {
  type        = string
  description = "Admin password to use for Rancher server bootstrap, min. 12 characters"
}

variable "rancher_dnsname" {
  type        = string
  description = "DNS host name of the Rancher server, self managed with DO object"
}

variable "downstream_kubernetes_version" {
  type        = string
  description = "Downstream custom cluster Kubernetes version"
  default     = "v1.22.11-rancher1-1"
}

variable "rke2_kubernetes_version" {
  type        = string
  description = "Downstream RKE2 cluster version"
  default = "v1.22.15+rke2r1"
}
