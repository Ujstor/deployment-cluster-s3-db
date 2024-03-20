locals {
  calculate_location_minio = [for idx in range(var.instances_minio) : var.location_list[idx % length(var.location_list)]]
}

resource "hcloud_server" "minio" {
  count       = var.instances_minio
  name        = "minio-${count.index}"
  image       = var.os_type
  server_type = var.server_type_minio
  location    = local.calculate_location_minio[count.index]
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "minio"
  }

  public_net {
    ipv4_enabled = var.public_net
    ipv6_enabled = var.public_net
  }

  depends_on = [
    hcloud_network_subnet.minio_subnet,
    hcloud_server.coolify_controler

  ]
}

resource "hcloud_volume" "minio_volume" {
  count    = var.volumes_per_node * var.instances_minio
  name     = "drive-${count.index + 1}"
  size     = var.disk_size
  location = local.calculate_location_minio[count.index % length(local.calculate_location_minio)]
  format   = "xfs"

  depends_on = [
    hcloud_server.minio
  ]
}

resource "hcloud_volume_attachment" "minio_vol_attachment" {
  count     = var.volumes_per_node * var.instances_minio
  volume_id = hcloud_volume.minio_volume[count.index].id
  server_id = hcloud_server.minio[count.index % length(hcloud_server.minio)].id
  automount = true

  depends_on = [
    hcloud_server.minio
  ]
}