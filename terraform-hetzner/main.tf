locals {
  calculate_location = [for idx in range(var.instances_coolify) : var.location_list[idx % length(var.location_list)]]
  calculate_location_backup = [for idx in range(var.instances_backup) : var.location_list[(length(var.location_list) - 1 - idx) % length(var.location_list)]]
}

resource "hcloud_server" "coolify" {
  count       = var.instances_coolify
  name        = "coolify-${count.index}"
  image       = var.os_type
  server_type = var.server_type_coolify
  location    = local.calculate_location[count.index]
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "coolify"
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

  depends_on = [
    hcloud_network_subnet.resource_subnet
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
    hcloud_network_subnet.resource_subnet
  ]  
}

resource "hcloud_volume" "backup_volume" {
  count    = var.instances_backup
  name     = "backup-volume-${count.index}"
  size     = var.disk_size
  location = local.calculate_location_backup[count.index]
  format   = "xfs"
}

resource "hcloud_volume_attachment" "backup_vol_attachment" {
  count     = var.instances_backup
  volume_id = hcloud_volume.backup_volume[count.index].id
  server_id = hcloud_server.backup[count.index].id
  automount = true
}