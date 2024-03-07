locals {
  calculate_location        = [for idx in range(var.instances_coolify_node) : var.location_list[idx % length(var.location_list)]]
  calculate_location_backup = [for idx in range(var.instances_backup) : var.location_list[idx % length(var.location_list)]]


}
resource "hcloud_server" "coolify_master" {
  count       = var.instances_coolify_master
  name        = "coolify-master"
  image       = var.os_type
  server_type = var.server_type_coolify_master
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "coolify-master"
  }

  provisioner "local-exec" {
    command = <<-EOT
     echo "${tls_private_key.ssh_key.private_key_pem}" > ~/.ssh/hetzner_key.pem &&
     echo "${tls_private_key.ssh_key.public_key_openssh}" > ~/.ssh/hetzner_key.pub &&
     chmod 600 ~/.ssh/hetzner_key.pem
   EOT
  }
  depends_on = [
    hcloud_network_subnet.deployment_subnet
  ]
}

resource "hcloud_server" "coolify_node" {
  count       = var.instances_coolify_node
  name        = "coolify-node-${count.index}"
  image       = var.os_type
  server_type = var.server_type_coolify_node
  location    = local.calculate_location[count.index]
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "coolify-node"
  }
  public_net {
    # On default public ip is enabled, after server provisioning with ansible
    # and lb setup changes public ip to false in vari.tfvars
    ipv4_enabled = var.public_net
    ipv6_enabled = var.public_net
  }

  depends_on = [
    hcloud_network_subnet.deployment_subnet
  ]
}

resource "hcloud_server" "postgres_db" {
  count       = var.instances_db
  name        = "postgres-${count.index}"
  image       = var.os_type
  server_type = var.server_type_db
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "db"
  }
  public_net {
    ipv4_enabled = var.public_net
    ipv6_enabled = var.public_net
  }

  depends_on = [
    hcloud_network_subnet.db_backup_subnet
  ]
}

resource "hcloud_server" "utils" {
  count       = var.instances_utils
  name        = "utils-${count.index}"
  image       = var.os_type
  server_type = var.server_type_utils
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "utils"
  }
  public_net {
    ipv4_enabled = var.public_net
    ipv6_enabled = var.public_net
  }

  depends_on = [
    hcloud_network_subnet.resource_subnet
  ]  
}

resource "hcloud_server" "backup" {
  count       = var.instances_backup
  name        = "backup-${count.index}"
  image       = var.os_type
  server_type = var.server_type_backup
  location    = local.calculate_location_backup[count.index]
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "backup"
  }

  depends_on = [
    hcloud_network_subnet.db_backup_subnet
  ]  
}

resource "hcloud_volume" "backup_volume" {
  count    = var.volumes_per_node * var.instances_backup
  name     = "backup-volume-${count.index}"
  size     = var.disk_size
  location = local.calculate_location_backup[count.index % length(local.calculate_location_backup)]
  format   = "xfs"

  depends_on = [
    hcloud_server.backup
  ]  
}

resource "hcloud_volume_attachment" "backup_vol_attachment" {
  count     = var.volumes_per_node * var.instances_backup
  volume_id = hcloud_volume.backup_volume[count.index].id
  server_id = element([for s in hcloud_server.backup : s.id if s.location == hcloud_volume.backup_volume[count.index].location], 0)
  automount = true

  depends_on = [
    hcloud_server.backup
  ]  
}