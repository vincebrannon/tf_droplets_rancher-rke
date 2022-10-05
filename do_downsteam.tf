resource "digitalocean_droplet" "downstream-all" {
  count       = var.downstream_all_roles_nodes
  image       = var.nodes_image
  name        = "${var.prefix}-downstream-all-${count.index}"
  vpc_uuid    = digitalocean_vpc.infra-clusters.id
  region      = var.region_server
  size        = var.size
  ssh_keys    = [digitalocean_ssh_key.pub-key.id]
  tags        = [join("",["user:",replace(split("@",data.digitalocean_account.do-account.email)[0],".","-")])]

  user_data = templatefile(
    "files/userdata_register",
    {
      docker_version = var.docker_version
      register_command = module.kubernetes_data.rke-custom_cluster_command
      node_roles = "--etcd --controlplane --worker"
    })

  provisioner "remote-exec" {
    connection {
      type          = "ssh"
      user          = var.user
      host          = self.ipv4_address
      private_key   = tls_private_key.priv-key.private_key_pem
    }
    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "cloud-init status --wait > /dev/null",
      "echo 'Completed cloud-init!'",
    ]
  }
}

resource "digitalocean_droplet" "downstream-etcd" {
  count       = var.downstream_etcd_nodes
  image       = var.nodes_image
  name        = "${var.prefix}-downstream-etcd-${count.index}"
  vpc_uuid    = digitalocean_vpc.infra-clusters.id
  region      = var.region_server
  size        = var.size
  ssh_keys    = [digitalocean_ssh_key.pub-key.id]
  tags        = [join("",["user:",replace(split("@",data.digitalocean_account.do-account.email)[0],".","-")])]

  user_data = templatefile(
    "files/userdata_register",
    {
      docker_version = var.docker_version
      register_command = module.kubernetes_data.rke-custom_cluster_command
      node_roles = "--etcd"
    })

  provisioner "remote-exec" {
    connection {
      type          = "ssh"
      user          = var.user
      host          = self.ipv4_address
      private_key   = tls_private_key.priv-key.private_key_pem
    }

    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "cloud-init status --wait > /dev/null",
      "echo 'Completed cloud-init!'",
    ]
  }
}

resource "digitalocean_droplet" "downstream-cp" {
  count       = var.downstream_cp_nodes
  image       = var.nodes_image
  name        = "${var.prefix}-downstream-cp-${count.index}"
  vpc_uuid    = digitalocean_vpc.infra-clusters.id
  region      = var.region_server
  size        = var.size
  ssh_keys    = [digitalocean_ssh_key.pub-key.id]
  tags        = [join("",["user:",replace(split("@",data.digitalocean_account.do-account.email)[0],".","-")])]

  user_data = templatefile(
    "files/userdata_register",
    {
      docker_version = var.docker_version
      register_command = module.kubernetes_data.rke-custom_cluster_command
      node_roles = "--controlplane"
    })

  provisioner "remote-exec" {
    connection {
      type          = "ssh"
      user          = var.user
      host          = self.ipv4_address
      private_key   = tls_private_key.priv-key.private_key_pem
    }

    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "cloud-init status --wait > /dev/null",
      "echo 'Completed cloud-init!'",
    ]
  }
}

resource "digitalocean_droplet" "downstream-worker" {
  count       = var.downstream_worker_nodes
  image       = var.nodes_image
  name        = "${var.prefix}-downstream-worker-${count.index}"
  vpc_uuid    = digitalocean_vpc.infra-clusters.id
  region      = var.region_server
  size        = var.size
  ssh_keys    = [digitalocean_ssh_key.pub-key.id]
  tags        = [join("",["user:",replace(split("@",data.digitalocean_account.do-account.email)[0],".","-")])]

  user_data = templatefile(
    "files/userdata_register",
    {
      docker_version = var.docker_version
      register_command = module.kubernetes_data.rke-custom_cluster_command
      node_roles = "--worker"
    })

  provisioner "remote-exec" {
    connection {
      type          = "ssh"
      user          = var.user
      host          = self.ipv4_address
      private_key   = tls_private_key.priv-key.private_key_pem
    }

    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "cloud-init status --wait > /dev/null",
      "echo 'Completed cloud-init!'",
    ]
  }
}
