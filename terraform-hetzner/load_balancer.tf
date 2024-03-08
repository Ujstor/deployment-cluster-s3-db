# resource "hcloud_load_balancer" "deployment_lb" {
#   name               = "deployment_lb"
#   load_balancer_type = "lb11"
#   location           = var.location
#   labels = {
#     type = "deployment"
#   }

#   algorithm {
#     type = "round_robin"
#   }

#   depends_on = [
#     hcloud_network_subnet.deployment_subnet
#   ]
# }

# resource "hcloud_load_balancer_service" "deployment_lb_service" {
#   load_balancer_id = hcloud_load_balancer.deployment_lb.id
#   protocol         = var.http_protocol
#   listen_port      = var.http_port
#   destination_port = var.http_port

#   health_check {
#     protocol = var.http_protocol
#     port     = var.http_port
#     interval = "10"
#     timeout  = "10"
#     http {
#       path         = "/"
#       status_codes = ["2??", "3??"]
#     }
#   }
# }

# resource "hcloud_load_balancer_target" "load_balancer_target" {
#   type             = "server"
#   count            = var.instances_coolify_node
#   load_balancer_id = hcloud_load_balancer.deployment_lb.id
#   server_id        = hcloud_server.coolify_node[count.index].id
#   use_private_ip   = true
# }

# resource "hcloud_load_balancer_network" "deployment_network" {
#   load_balancer_id        = hcloud_load_balancer.deployment_lb.id
#   subnet_id               = hcloud_network_subnet.deployment_subnet.id
#   ip                      = cidrhost(hcloud_network_subnet.deployment_subnet.ip_range, 244)
#   enable_public_interface = "true"
# }


# Custom load balancer/uncomet: code above if you want to use a hetzner one
# nginx offers more options
resource "hcloud_server" "nginx_lb" {
  count       = var.instances_lb
  name        = "nginx-lb-${count.index}"
  image       = var.os_type
  server_type = var.server_type_coolify_master
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "nginx-lb"
  }

  depends_on = [
    hcloud_network_subnet.deployment_subnet
  ]
}

resource "hcloud_server_network" "deployment_subnet_lb" {
  count     = var.instances_lb
  server_id = hcloud_server.nginx_lb[count.index].id
  subnet_id = hcloud_network_subnet.deployment_subnet.id
  ip        = local.available_ip_deploymet[count.index + var.instances_coolify_node + var.instances_lb]
}


# Lb for internal traffic to MinIo backup with private DNS server and outside access
resource "hcloud_server" "minio_lb" {
  count       = var.instances_minio_lb
  name        = "minio-lb-${count.index}"
  image       = var.os_type
  server_type = var.server_type_coolify_master
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "minio-lb"
  }

  provisioner "local-exec" {
    command = <<-EOT
     echo "${tls_private_key.ssh_key.private_key_pem}" > ~/.ssh/hetzner_key.pem &&
     echo "${tls_private_key.ssh_key.public_key_openssh}" > ~/.ssh/hetzner_key.pub &&
     chmod 600 ~/.ssh/hetzner_key.pem
   EOT
  }

  depends_on = [
    hcloud_network_subnet.db_backup_subnet
  ]
}

resource "hcloud_server_network" "deployment_subnet_miniio_lb" {
  count     = var.instances_lb
  server_id = hcloud_server.minio_lb[count.index].id
  subnet_id = hcloud_network_subnet.db_backup_subnet.id
  ip        = local.available_ip_deploymet[count.index + var.instances_db + var.instances_minio_lb]
}
