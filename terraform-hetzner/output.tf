output "server_ips" {
  value = {
    coolify_master = {
      for idx, instance in hcloud_server.coolify_master : instance.name => instance.ipv4_address
    },
    coolify_node = {
      for idx, instance in hcloud_server.coolify_node : instance.name => instance.ipv4_address
    },
    nginx_lb = {
      for idx, instance in hcloud_server.nginx_lb : instance.name => instance.ipv4_address
    },
    minio_lb = {
      for idx, instance in hcloud_server.minio_lb : instance.name => instance.ipv4_address
    },
    postgres_db = {
      for idx, instance in hcloud_server.postgres_db : instance.name => instance.ipv4_address
    },
    utils = {
      for idx, instance in hcloud_server.utils : instance.name => instance.ipv4_address
    },
    backup = {
      for idx, instance in hcloud_server.backup : instance.name => instance.ipv4_address
    }
  }
}

output "server_status" {
  value = {
    coolify_master = {
      for instance in hcloud_server.coolify_master : instance.name => instance.status
    },
    coolify_node = {
      for instance in hcloud_server.coolify_node : instance.name => instance.status
    },
    nginx_lb = {
      for instance in hcloud_server.nginx_lb : instance.name => instance.status
    },
    minio_lb = {
      for instance in hcloud_server.minio_lb : instance.name => instance.status
    },
    postgres_db = {
      for instance in hcloud_server.postgres_db : instance.name => instance.status
    },
    utils = {
      for instance in hcloud_server.utils : instance.name => instance.status
    },
    backup = {
      for instance in hcloud_server.backup : instance.name => instance.status
    }
  }
}

# output "lb_ip" {
#   value = hcloud_load_balancer.deployment_lb.ipv4
# }

output "public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
}