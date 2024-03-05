resource "hcloud_network" "network" {
  name     = "network"
  ip_range = "10.0.0.0/16"
}


resource "hcloud_network_subnet" "deployment_subnet" {
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_server_network" "deployment_subnet" {
  count     = var.instances_coolify
  server_id = hcloud_server.coolify[count.index].id
  subnet_id = hcloud_network_subnet.deployment_subnet.id
  ip        = cidrhost(hcloud_network_subnet.deployment_subnet.ip_range, count.index + 3)
}

resource "hcloud_load_balancer" "deployment_lb" {
  name               = "deployment_lb"
  load_balancer_type = "lb11"
  location           = var.location
  labels = {
    type = "deployment"
  }

  algorithm {
    type = "round_robin"
  }

  depends_on = [
    hcloud_network_subnet.deployment_subnet
  ]  
}

resource "hcloud_load_balancer_service" "deployment_lb_service" {
  load_balancer_id = hcloud_load_balancer.deployment_lb.id
  protocol         = var.http_protocol
  listen_port      = var.http_port
  destination_port = var.http_port

  health_check {
    protocol = var.http_protocol
    port     = var.http_port
    interval = "10"
    timeout  = "10"
    http {
      path         = "/"
      status_codes = ["2??", "3??"]
    }
  }
}

resource "hcloud_load_balancer_target" "load_balancer_target" {
  type             = "server"
  count            = var.instances_coolify
  load_balancer_id = hcloud_load_balancer.deployment_lb.id
  server_id        = hcloud_server.coolify[count.index].id
}

resource "hcloud_load_balancer_network" "deployment_network" {
  load_balancer_id        = hcloud_load_balancer.deployment_lb.id
  subnet_id = hcloud_network_subnet.deployment_subnet.id
  ip        = cidrhost(hcloud_network_subnet.deployment_subnet.ip_range, count.index + 3)
  enable_public_interface = "true"
}


resource "hcloud_network_subnet" "resource_subnet" {
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.2.0/24"
}


resource "hcloud_server_network" "db_subnet" {
  count     = var.instances_db
  server_id = hcloud_server.postgres_db[count.index].id
  subnet_id = hcloud_network_subnet.resource_subnet.id
  ip        = cidrhost(hcloud_network_subnet.resource_subnet.ip_range, count.index + 3)
}

resource "hcloud_server_network" "utils_subnet" {
  count     = var.instances_utils
  server_id = hcloud_server.utils[count.index].id
  subnet_id = hcloud_network_subnet.resource_subnet.id
  ip        = cidrhost(hcloud_network_subnet.resource_subnet.ip_range, count.index + 6)
}

resource "hcloud_server_network" "backup_subnet" {
  count     = var.instances_backup
  server_id = hcloud_server.backup[count.index].id
  subnet_id = hcloud_network_subnet.resource_subnet.id
  ip        = cidrhost(hcloud_network_subnet.resource_subnet.ip_range, count.index + 9)
}
