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
  count            = var.instances_coolify_node
  load_balancer_id = hcloud_load_balancer.deployment_lb.id
  server_id        = hcloud_server.coolify_node[count.index].id
}

resource "hcloud_load_balancer_network" "deployment_network" {
  load_balancer_id        = hcloud_load_balancer.deployment_lb.id
  subnet_id               = hcloud_network_subnet.deployment_subnet.id
  ip                      = cidrhost(hcloud_network_subnet.deployment_subnet.ip_range, 244)
  enable_public_interface = "true"
}