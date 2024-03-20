locals {
  calculate_location_db = [for idx in range(var.instances_db) : var.location_list[idx % length(var.location_list)]]
}

resource "hcloud_server" "postgres_db" {
  count       = var.instances_db
  name        = "postgres-${count.index}"
  image       = var.os_type
  server_type = var.server_type_db
  location    = local.calculate_location_db[count.index]
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "db"
  }

  public_net {
    ipv4_enabled = var.public_net
    ipv6_enabled = var.public_net
  }

  depends_on = [
    hcloud_network_subnet.db_subnet,
    hcloud_server.coolify_controler
  ]
}