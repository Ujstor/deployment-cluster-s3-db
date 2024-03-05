resource "hcloud_server" "coolify" {
  count       = var.instances_coolfy
  name        = "coolify-${count.index}"
  image       = var.os_type
  server_type = var.server_type_coolify
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "coolify"
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo "${tls_private_key.ssh_key.private_key_pem}" > ~/.ssh/hetzner_key.pem &&
      chmod 600 ~/.ssh/hetzner_key.pem
    EOT
  }
}

resource "hcloud_server" "postgres_db" {
  count       = var.instances_db
  name        = "postgres_db"
  image       = var.os_type
  server_type = var.server_type_db
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "db"
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo "${tls_private_key.ssh_key.private_key_pem}" > ~/.ssh/hetzner_key.pem &&
      chmod 600 ~/.ssh/hetzner_key.pem
    EOT
  }
}


resource "hcloud_server" "utils" {
  count       = var.instances_utils
  name        = "utils-${count.index}"
  image       = var.os_type
  server_type = var.server_type_utils
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "utils"
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo "${tls_private_key.ssh_key.private_key_pem}" > ~/.ssh/hetzner_key.pem &&
      chmod 600 ~/.ssh/hetzner_key.pem
    EOT
  }
}

resource "hcloud_server" "backup" {
  count       = var.instances_backup
  name        = "backup"
  image       = var.os_type
  server_type = var.server_type_backup
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "backup"
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo "${tls_private_key.ssh_key.private_key_pem}" > ~/.ssh/hetzner_key.pem &&
      chmod 600 ~/.ssh/hetzner_key.pem
    EOT
  }
}
