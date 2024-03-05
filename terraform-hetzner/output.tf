output "server_ip" {
  value = [for instance in hcloud_server.coolify : instance.ipv4_address]
}
