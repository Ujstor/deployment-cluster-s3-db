output "server_ips" {
  value = {
    coolify_controler = {
      for idx, instance in hcloud_server.coolify_controler : instance.name => instance.ipv4_address
    },
    coolify_worker = {
      for idx, instance in hcloud_server.coolify_worker : instance.name => instance.ipv4_address
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
    services = {
      for idx, instance in hcloud_server.services : instance.name => instance.ipv4_address
    },
    minio = {
      for idx, instance in hcloud_server.minio : instance.name => instance.ipv4_address
    }
  }
}

output "server_status" {
  value = {
    coolify_controler = {
      for instance in hcloud_server.coolify_controler : instance.name => instance.status
    },
    coolify_worker = {
      for instance in hcloud_server.coolify_worker : instance.name => instance.status
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
    services = {
      for instance in hcloud_server.services : instance.name => instance.status
    },
    minio = {
      for instance in hcloud_server.minio : instance.name => instance.status
    }
  }
}


output "public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
}