output "server_ips" {
  value = {
    coolify = {
      for idx, instance in hcloud_server.coolify : instance.name => instance.ipv4_address
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
    coolify = {
      for instance in hcloud_server.coolify : instance.name => instance.status
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

output "lb_ip" {
  value = hcloud_load_balancer.deployment_lb.ipv4
}

output "public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
}

