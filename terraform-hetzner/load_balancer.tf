resource "hcloud_server" "nginx_lb" {
  count       = var.instances_lb
  name        = "nginx-lb-${count.index}"
  image       = var.os_type
  server_type = var.server_type_coolify_controler
  location    = var.location_list[0]
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "nginx-lb"
  }

  depends_on = [
    hcloud_network_subnet.deployment_subnet,
    hcloud_server.coolify_controler,
    hcloud_server.coolify_worker
  ]
}

resource "hcloud_server_network" "deployment_subnet_lb" {
  count     = var.instances_lb
  server_id = hcloud_server.nginx_lb[count.index].id
  subnet_id = hcloud_network_subnet.deployment_subnet.id
  ip        = local.available_ip_deploymet[count.index + var.instances_coolify_worker + var.instances_lb]
}


# Lb for internal traffic to MinIo backup with private DNS server and outside access
resource "hcloud_server" "minio_lb" {
  count       = var.instances_minio_lb
  name        = "minio-lb-${count.index}"
  image       = var.os_type
  server_type = var.server_type_minio
  location    = var.location_list[0]
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "minio-lb"
  }

  depends_on = [
    hcloud_network_subnet.minio_subnet,
    hcloud_server.minio,
    hcloud_server.coolify_controler
  ]
}

resource "hcloud_server_network" "deployment_subnet_minio_lb" {
  count     = var.instances_minio_lb
  server_id = hcloud_server.minio_lb[count.index].id
  subnet_id = hcloud_network_subnet.minio_subnet.id
  ip        = local.available_ip_minio[count.index + var.instances_minio + var.instances_minio_lb]
}