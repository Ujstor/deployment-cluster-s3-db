```bash
terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # hcloud_load_balancer.deployment_lb will be created
  + resource "hcloud_load_balancer" "deployment_lb" {
      + delete_protection  = false
      + id                 = (known after apply)
      + ipv4               = (known after apply)
      + ipv6               = (known after apply)
      + labels             = {
          + "type" = "deployment"
        }
      + load_balancer_type = "lb11"
      + location           = "fsn1"
      + name               = "deployment_lb"
      + network_id         = (known after apply)
      + network_ip         = (known after apply)
      + network_zone       = (known after apply)

      + algorithm {
          + type = "round_robin"
        }
    }

  # hcloud_load_balancer_network.deployment_network will be created
  + resource "hcloud_load_balancer_network" "deployment_network" {
      + enable_public_interface = true
      + id                      = (known after apply)
      + ip                      = "10.0.1.244"
      + load_balancer_id        = (known after apply)
      + subnet_id               = (known after apply)
    }

  # hcloud_load_balancer_service.deployment_lb_service will be created
  + resource "hcloud_load_balancer_service" "deployment_lb_service" {
      + destination_port = 80
      + id               = (known after apply)
      + listen_port      = 80
      + load_balancer_id = (known after apply)
      + protocol         = "http"
      + proxyprotocol    = (known after apply)

      + health_check {
          + interval = 10
          + port     = 80
          + protocol = "http"
          + retries  = (known after apply)
          + timeout  = 10

          + http {
              + path         = "/"
              + status_codes = [
                  + "2??",
                  + "3??",
                ]
            }
        }
    }

  # hcloud_load_balancer_target.load_balancer_target[0] will be created
  + resource "hcloud_load_balancer_target" "load_balancer_target" {
      + id               = (known after apply)
      + load_balancer_id = (known after apply)
      + server_id        = (known after apply)
      + type             = "server"
      + use_private_ip   = (known after apply)
    }

  # hcloud_load_balancer_target.load_balancer_target[1] will be created
  + resource "hcloud_load_balancer_target" "load_balancer_target" {
      + id               = (known after apply)
      + load_balancer_id = (known after apply)
      + server_id        = (known after apply)
      + type             = "server"
      + use_private_ip   = (known after apply)
    }

  # hcloud_load_balancer_target.load_balancer_target[2] will be created
  + resource "hcloud_load_balancer_target" "load_balancer_target" {
      + id               = (known after apply)
      + load_balancer_id = (known after apply)
      + server_id        = (known after apply)
      + type             = "server"
      + use_private_ip   = (known after apply)
    }

  # hcloud_load_balancer_target.load_balancer_target[3] will be created
  + resource "hcloud_load_balancer_target" "load_balancer_target" {
      + id               = (known after apply)
      + load_balancer_id = (known after apply)
      + server_id        = (known after apply)
      + type             = "server"
      + use_private_ip   = (known after apply)
    }

  # hcloud_network.network will be created
  + resource "hcloud_network" "network" {
      + delete_protection        = false
      + expose_routes_to_vswitch = false
      + id                       = (known after apply)
      + ip_range                 = "10.0.0.0/16"
      + name                     = "network"
    }

  # hcloud_network_subnet.db_backup_subnet will be created
  + resource "hcloud_network_subnet" "db_backup_subnet" {
      + gateway      = (known after apply)
      + id           = (known after apply)
      + ip_range     = "10.0.3.0/24"
      + network_id   = (known after apply)
      + network_zone = "eu-central"
      + type         = "cloud"
    }

  # hcloud_network_subnet.deployment_subnet will be created
  + resource "hcloud_network_subnet" "deployment_subnet" {
      + gateway      = (known after apply)
      + id           = (known after apply)
      + ip_range     = "10.0.1.0/24"
      + network_id   = (known after apply)
      + network_zone = "eu-central"
      + type         = "cloud"
    }

  # hcloud_network_subnet.resource_subnet will be created
  + resource "hcloud_network_subnet" "resource_subnet" {
      + gateway      = (known after apply)
      + id           = (known after apply)
      + ip_range     = "10.0.2.0/24"
      + network_id   = (known after apply)
      + network_zone = "eu-central"
      + type         = "cloud"
    }

  # hcloud_server.backup[0] will be created
  + resource "hcloud_server" "backup" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "ubuntu-22.04"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "backup"
        }
      + location                   = "hel1"
      + name                       = "backup-0"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx31"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)
    }

  # hcloud_server.backup[1] will be created
  + resource "hcloud_server" "backup" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "ubuntu-22.04"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "backup"
        }
      + location                   = "nbg1"
      + name                       = "backup-1"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx31"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)
    }

  # hcloud_server.coolify_master[0] will be created
  + resource "hcloud_server" "coolify_master" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "ubuntu-22.04"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "coolify-master"
        }
      + location                   = "fsn1"
      + name                       = "coolify-master"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx11"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)
    }

  # hcloud_server.coolify_node[0] will be created
  + resource "hcloud_server" "coolify_node" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "ubuntu-22.04"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "coolify-node"
        }
      + location                   = "fsn1"
      + name                       = "coolify-node-0"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx21"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = true
          + ipv6         = (known after apply)
          + ipv6_enabled = true
        }
    }

  # hcloud_server.coolify_node[1] will be created
  + resource "hcloud_server" "coolify_node" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "ubuntu-22.04"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "coolify-node"
        }
      + location                   = "nbg1"
      + name                       = "coolify-node-1"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx21"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = true
          + ipv6         = (known after apply)
          + ipv6_enabled = true
        }
    }

  # hcloud_server.coolify_node[2] will be created
  + resource "hcloud_server" "coolify_node" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "ubuntu-22.04"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "coolify-node"
        }
      + location                   = "hel1"
      + name                       = "coolify-node-2"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx21"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = true
          + ipv6         = (known after apply)
          + ipv6_enabled = true
        }
    }

  # hcloud_server.coolify_node[3] will be created
  + resource "hcloud_server" "coolify_node" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "ubuntu-22.04"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "coolify-node"
        }
      + location                   = "fsn1"
      + name                       = "coolify-node-3"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx21"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = true
          + ipv6         = (known after apply)
          + ipv6_enabled = true
        }
    }

  # hcloud_server.postgres_db[0] will be created
  + resource "hcloud_server" "postgres_db" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "ubuntu-22.04"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "db"
        }
      + location                   = "fsn1"
      + name                       = "postgres-0"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx41"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = true
          + ipv6         = (known after apply)
          + ipv6_enabled = true
        }
    }

  # hcloud_server.utils[0] will be created
  + resource "hcloud_server" "utils" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "ubuntu-22.04"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "utils"
        }
      + location                   = "fsn1"
      + name                       = "utils-0"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx21"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = true
          + ipv6         = (known after apply)
          + ipv6_enabled = true
        }
    }

  # hcloud_server.utils[1] will be created
  + resource "hcloud_server" "utils" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "ubuntu-22.04"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "utils"
        }
      + location                   = "fsn1"
      + name                       = "utils-1"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx21"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = true
          + ipv6         = (known after apply)
          + ipv6_enabled = true
        }
    }

  # hcloud_server_network.backup_subnet[0] will be created
  + resource "hcloud_server_network" "backup_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.3.3"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.backup_subnet[1] will be created
  + resource "hcloud_server_network" "backup_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.3.4"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.db_subnet[0] will be created
  + resource "hcloud_server_network" "db_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.3.2"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.deployment_subnet[0] will be created
  + resource "hcloud_server_network" "deployment_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.1.2"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.deployment_subnet[1] will be created
  + resource "hcloud_server_network" "deployment_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.1.3"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.deployment_subnet[2] will be created
  + resource "hcloud_server_network" "deployment_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.1.4"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.deployment_subnet[3] will be created
  + resource "hcloud_server_network" "deployment_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.1.5"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.deployment_subnet_master[0] will be created
  + resource "hcloud_server_network" "deployment_subnet_master" {
      + id          = (known after apply)
      + ip          = "10.0.1.6"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.utils_subnet[0] will be created
  + resource "hcloud_server_network" "utils_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.2.2"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.utils_subnet[1] will be created
  + resource "hcloud_server_network" "utils_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.2.3"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_ssh_key.default will be created
  + resource "hcloud_ssh_key" "default" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + name        = "hetzner_key"
      + public_key  = (known after apply)
    }

  # hcloud_volume.backup_volume[0] will be created
  + resource "hcloud_volume" "backup_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "hel1"
      + name              = "backup-volume-0"
      + server_id         = (known after apply)
      + size              = 100
    }

  # hcloud_volume.backup_volume[1] will be created
  + resource "hcloud_volume" "backup_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "nbg1"
      + name              = "backup-volume-1"
      + server_id         = (known after apply)
      + size              = 100
    }

  # hcloud_volume_attachment.backup_vol_attachment[0] will be created
  + resource "hcloud_volume_attachment" "backup_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.backup_vol_attachment[1] will be created
  + resource "hcloud_volume_attachment" "backup_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # tls_private_key.ssh_key will be created
  + resource "tls_private_key" "ssh_key" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

Plan: 37 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + lb_ip         = (known after apply)
  + public_key    = (known after apply)
  + server_ips    = {
      + backup         = {
          + backup-0 = (known after apply)
          + backup-1 = (known after apply)
        }
      + coolify_master = {
          + coolify-master = (known after apply)
        }
      + coolify_node   = {
          + coolify-node-0 = (known after apply)
          + coolify-node-1 = (known after apply)
          + coolify-node-2 = (known after apply)
          + coolify-node-3 = (known after apply)
        }
      + postgres_db    = {
          + postgres-0 = (known after apply)
        }
      + utils          = {
          + utils-0 = (known after apply)
          + utils-1 = (known after apply)
        }
    }
  + server_status = {
      + backup         = {
          + backup-0 = (known after apply)
          + backup-1 = (known after apply)
        }
      + coolify_master = {
          + coolify-master = (known after apply)
        }
      + coolify_node   = {
          + coolify-node-0 = (known after apply)
          + coolify-node-1 = (known after apply)
          + coolify-node-2 = (known after apply)
          + coolify-node-3 = (known after apply)
        }
      + postgres_db    = {
          + postgres-0 = (known after apply)
        }
      + utils          = {
          + utils-0 = (known after apply)
          + utils-1 = (known after apply)
        }
    }

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

hcloud_network.network: Creating...
hcloud_volume.backup_volume[1]: Creating...
tls_private_key.ssh_key: Creating...
hcloud_volume.backup_volume[0]: Creating...
tls_private_key.ssh_key: Creation complete after 1s [id=556e4c0b16958ba2ea320b77b36e464f3ca5b277]
hcloud_ssh_key.default: Creating...
hcloud_ssh_key.default: Creation complete after 3s [id=19888940]
hcloud_network.network: Creation complete after 5s [id=3969272]
hcloud_network_subnet.resource_subnet: Creating...
hcloud_network_subnet.db_backup_subnet: Creating...
hcloud_network_subnet.deployment_subnet: Creating...
hcloud_network_subnet.deployment_subnet: Creation complete after 3s [id=3969272-10.0.1.0/24]
hcloud_load_balancer.deployment_lb: Creating...
hcloud_server.coolify_master[0]: Creating...
hcloud_server.coolify_node[3]: Creating...
hcloud_server.coolify_node[1]: Creating...
hcloud_server.coolify_node[2]: Creating...
hcloud_server.coolify_node[0]: Creating...
hcloud_volume.backup_volume[1]: Creation complete after 9s [id=100443501]
hcloud_network_subnet.resource_subnet: Creation complete after 5s [id=3969272-10.0.2.0/24]
hcloud_server.utils[0]: Creating...
hcloud_server.utils[1]: Creating...
hcloud_volume.backup_volume[0]: Still creating... [10s elapsed]
hcloud_network_subnet.db_backup_subnet: Creation complete after 6s [id=3969272-10.0.3.0/24]
hcloud_server.backup[1]: Creating...
hcloud_volume.backup_volume[0]: Creation complete after 12s [id=100443502]
hcloud_server.backup[0]: Creating...
hcloud_load_balancer.deployment_lb: Creation complete after 4s [id=1732141]
hcloud_server.postgres_db[0]: Creating...
hcloud_server.coolify_master[0]: Still creating... [10s elapsed]
hcloud_server.coolify_node[2]: Still creating... [10s elapsed]
hcloud_server.coolify_node[3]: Still creating... [10s elapsed]
hcloud_server.coolify_node[1]: Still creating... [10s elapsed]
hcloud_server.coolify_node[0]: Still creating... [10s elapsed]
hcloud_server.utils[0]: Still creating... [10s elapsed]
hcloud_server.utils[1]: Still creating... [10s elapsed]
hcloud_server.backup[1]: Still creating... [10s elapsed]
hcloud_server.backup[0]: Still creating... [10s elapsed]
hcloud_server.postgres_db[0]: Still creating... [10s elapsed]
hcloud_server.coolify_node[1]: Creation complete after 15s [id=44283235]
hcloud_load_balancer_service.deployment_lb_service: Creating...
hcloud_server.coolify_node[0]: Creation complete after 19s [id=44283236]
hcloud_load_balancer_network.deployment_network: Creating...
hcloud_server.backup[0]: Creation complete after 16s [id=44283241]
hcloud_server.coolify_master[0]: Still creating... [20s elapsed]
hcloud_server.coolify_node[3]: Still creating... [20s elapsed]
hcloud_server.coolify_node[2]: Still creating... [20s elapsed]
hcloud_server.coolify_master[0]: Provisioning with 'local-exec'...
hcloud_server.coolify_master[0] (local-exec): (output suppressed due to sensitive value in config)
hcloud_server.coolify_master[0]: Creation complete after 20s [id=44283238]
hcloud_server_network.deployment_subnet_master[0]: Creating...
hcloud_server.coolify_node[3]: Creation complete after 21s [id=44283237]
hcloud_load_balancer_service.deployment_lb_service: Creation complete after 6s [id=1732141__80]
hcloud_server.coolify_node[2]: Creation complete after 22s [id=44283240]
hcloud_server_network.deployment_subnet[2]: Creating...
hcloud_server_network.deployment_subnet[3]: Creating...
hcloud_server_network.deployment_subnet[1]: Creating...
hcloud_load_balancer_target.load_balancer_target[0]: Creating...
hcloud_server.utils[0]: Still creating... [20s elapsed]
hcloud_server.utils[1]: Still creating... [20s elapsed]
hcloud_server.postgres_db[0]: Creation complete after 18s [id=44283239]
hcloud_server_network.deployment_subnet[0]: Creating...
hcloud_server.backup[1]: Still creating... [20s elapsed]
hcloud_server.utils[0]: Creation complete after 21s [id=44283244]
hcloud_load_balancer_target.load_balancer_target[1]: Creating...
hcloud_server.backup[1]: Creation complete after 21s [id=44283247]
hcloud_load_balancer_target.load_balancer_target[2]: Creating...
hcloud_server.utils[1]: Creation complete after 23s [id=44283243]
hcloud_load_balancer_target.load_balancer_target[3]: Creating...
hcloud_server_network.deployment_subnet[1]: Creation complete after 5s [id=44283235-3969272]
hcloud_server_network.db_subnet[0]: Creating...
hcloud_load_balancer_network.deployment_network: Still creating... [10s elapsed]
hcloud_server_network.deployment_subnet_master[0]: Creation complete after 10s [id=44283238-3969272]
hcloud_volume_attachment.backup_vol_attachment[0]: Creating...
hcloud_load_balancer_target.load_balancer_target[0]: Creation complete after 8s [id=lb-srv-tgt-44283236-1732141]
hcloud_volume_attachment.backup_vol_attachment[1]: Creating...
hcloud_load_balancer_target.load_balancer_target[1]: Creation complete after 7s [id=lb-srv-tgt-44283235-1732141]
hcloud_server_network.backup_subnet[0]: Creating...
hcloud_server_network.deployment_subnet[3]: Still creating... [10s elapsed]
hcloud_server_network.deployment_subnet[2]: Still creating... [10s elapsed]
hcloud_server_network.deployment_subnet[3]: Creation complete after 10s [id=44283237-3969272]
hcloud_server_network.backup_subnet[1]: Creating...
hcloud_server_network.deployment_subnet[0]: Still creating... [10s elapsed]
hcloud_load_balancer_target.load_balancer_target[2]: Creation complete after 8s [id=lb-srv-tgt-44283240-1732141]
hcloud_server_network.utils_subnet[0]: Creating...
hcloud_load_balancer_target.load_balancer_target[3]: Creation complete after 7s [id=lb-srv-tgt-44283237-1732141]
hcloud_server_network.utils_subnet[1]: Creating...
hcloud_load_balancer_network.deployment_network: Creation complete after 14s [id=1732141-3969272]
hcloud_server_network.deployment_subnet[0]: Creation complete after 11s [id=44283236-3969272]
hcloud_server_network.db_subnet[0]: Creation complete after 7s [id=44283239-3969272]
hcloud_server_network.utils_subnet[1]: Creation complete after 4s [id=44283243-3969272]
hcloud_server_network.backup_subnet[0]: Creation complete after 6s [id=44283241-3969272]
hcloud_server_network.deployment_subnet[2]: Creation complete after 15s [id=44283240-3969272]
hcloud_server_network.backup_subnet[1]: Creation complete after 5s [id=44283247-3969272]
hcloud_server_network.utils_subnet[0]: Creation complete after 8s [id=44283244-3969272]
hcloud_volume_attachment.backup_vol_attachment[0]: Creation complete after 10s [id=100443502]
hcloud_volume_attachment.backup_vol_attachment[1]: Still creating... [10s elapsed]
hcloud_volume_attachment.backup_vol_attachment[1]: Creation complete after 12s [id=100443501]

Apply complete! Resources: 37 added, 0 changed, 0 destroyed.

Outputs:

lb_ip = "128.140.29.1"
public_key = <<EOT
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4Wr9599JlJm9erXtcmG6r8rKN35CxvE/Mg20V+l/pvgShcEBi5ydWZhtZfLW0ykt+alM2HGXgfScAcq601KdQgqpljF3N4oBJ/jnotSVOOUYppFeDAAcEO275u5JkzRptTpfc4qDm1BG6fKXNHB4Z5pyi/8Q2OT2weKtHi+6uJIR9ARoPIBGbjxCdpz+nHM7biCRUixUAKC+D2Cg2spcYfpygPuLK8lFHT7LneRBhJw16fAXTkK8W+6POq1E5KhINIyTtPQyBtbinO7a40EaN7KPQ4uwk+qSJmJJRhx0OibCO10HXUpTtqAgAoIGvsb0knyXmDvpjtfLoCSWQNt2JX65WxUPLol+5elyNzolrBvoiw7/Bwm9ZwmnxV4uyi2orYEw2O0rMQQR2Z0dFWcEhiXYMf4f/KIldzWXxgGUzaylBXxt5/I0MjfsUZoeCX7UQWyLKmEXUvKK4JRHu8NSSoMyBB55xP7kbGLwXmGzqMdt57UPkOrxYtQsqUo4KvPlixiJPh5fNhZeOYo3AbmwMULjlR+DElG63zo97S7ksTGc22HJES+ueWZH/hD7dLQ3hGpCIaCyY8z+la3ruP9P/8ycMxIxVJ253JNx4Mw5QlrjWslWyT8iLd26YEsHGVfgQiCzLK5LwAo5k4Jouv9pIfuOYIEugZrHmfDhZRGRNkQ==

EOT
server_ips = {
  "backup" = {
    "backup-0" = "95.216.216.200"
    "backup-1" = "78.46.126.157"
  }
  "coolify_master" = {
    "coolify-master" = "49.13.73.3"
  }
  "coolify_node" = {
    "coolify-node-0" = "168.119.96.163"
    "coolify-node-1" = "5.75.139.83"
    "coolify-node-2" = "65.109.9.72"
    "coolify-node-3" = "162.55.162.239"
  }
  "postgres_db" = {
    "postgres-0" = "91.107.208.20"
  }
  "utils" = {
    "utils-0" = "91.107.197.216"
    "utils-1" = "49.12.13.149"
  }
}
server_status = {
  "backup" = {
    "backup-0" = "running"
    "backup-1" = "running"
  }
  "coolify_master" = {
    "coolify-master" = "running"
  }
  "coolify_node" = {
    "coolify-node-0" = "running"
    "coolify-node-1" = "running"
    "coolify-node-2" = "running"
    "coolify-node-3" = "running"
  }
  "postgres_db" = {
    "postgres-0" = "running"
  }
  "utils" = {
    "utils-0" = "running"
    "utils-1" = "running"
  }
}
```
