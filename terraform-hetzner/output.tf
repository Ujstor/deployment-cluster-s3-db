output "server_ips" {
  value = concat(
    [for instance in hcloud_server.coolify : instance.ipv4_address],
    [for instance in hcloud_server.postgres_db : instance.ipv4_address],
    [for instance in hcloud_server.utils : instance.ipv4_address],
    [for instance in hcloud_server.backup : instance.ipv4_address]
  )
}