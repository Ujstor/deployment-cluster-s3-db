```bash
terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # hcloud_network.network will be created
  + resource "hcloud_network" "network" {
      + delete_protection        = false
      + expose_routes_to_vswitch = false
      + id                       = (known after apply)
      + ip_range                 = "10.0.0.0/16"
      + name                     = "network"
    }

  # hcloud_network_subnet.db_subnet will be created
  + resource "hcloud_network_subnet" "db_subnet" {
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

  # hcloud_network_subnet.minio_subnet will be created
  + resource "hcloud_network_subnet" "minio_subnet" {
      + gateway      = (known after apply)
      + id           = (known after apply)
      + ip_range     = "10.0.4.0/24"
      + network_id   = (known after apply)
      + network_zone = "eu-central"
      + type         = "cloud"
    }

  # hcloud_network_subnet.services_subnet will be created
  + resource "hcloud_network_subnet" "services_subnet" {
      + gateway      = (known after apply)
      + id           = (known after apply)
      + ip_range     = "10.0.2.0/24"
      + network_id   = (known after apply)
      + network_zone = "eu-central"
      + type         = "cloud"
    }

  # hcloud_server.coolify_controler[0] will be created
  + resource "hcloud_server" "coolify_controler" {
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
          + "type" = "coolify-controler"
        }
      + location                   = "fsn1"
      + name                       = "coolify-controler-0"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx11"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)
    }

  # hcloud_server.coolify_worker[0] will be created
  + resource "hcloud_server" "coolify_worker" {
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
          + "type" = "coolify-worker"
        }
      + location                   = "fsn1"
      + name                       = "coolify-worker-0"
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

  # hcloud_server.coolify_worker[1] will be created
  + resource "hcloud_server" "coolify_worker" {
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
          + "type" = "coolify-worker"
        }
      + location                   = "nbg1"
      + name                       = "coolify-worker-1"
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

  # hcloud_server.coolify_worker[2] will be created
  + resource "hcloud_server" "coolify_worker" {
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
          + "type" = "coolify-worker"
        }
      + location                   = "hel1"
      + name                       = "coolify-worker-2"
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

  # hcloud_server.coolify_worker[3] will be created
  + resource "hcloud_server" "coolify_worker" {
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
          + "type" = "coolify-worker"
        }
      + location                   = "fsn1"
      + name                       = "coolify-worker-3"
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

  # hcloud_server.minio[0] will be created
  + resource "hcloud_server" "minio" {
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
          + "type" = "minio"
        }
      + location                   = "fsn1"
      + name                       = "minio-0"
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

  # hcloud_server.minio[1] will be created
  + resource "hcloud_server" "minio" {
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
          + "type" = "minio"
        }
      + location                   = "nbg1"
      + name                       = "minio-1"
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

  # hcloud_server.minio[2] will be created
  + resource "hcloud_server" "minio" {
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
          + "type" = "minio"
        }
      + location                   = "hel1"
      + name                       = "minio-2"
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

  # hcloud_server.minio[3] will be created
  + resource "hcloud_server" "minio" {
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
      + ipv6_address               = (known after apply)├── ansible/
│   ├── inventory/
│   │   └── hosts
│   ├── playbooks/
│   │   ├── roles/
│   │   │   ├── common/
│   │   │   ├── coolify/
│   │   │   ├── minio/
│   │   │   ├── nginx/
│   │   │   └── postgresql/
│   │   ├── unique_templates_config/
│   │   │   ├── coolify_lb/
│   │   │   ├── minio_lb/
│   │   │   ├── scripts/
│   │   │   ├── ssl/
│   │   │   ├── playbook_install_python.yml
│   │   │   └── playbook_minio_preconfig.yml
│   │   ├── playbook_install_coolify.yml
│   │   ├── playbook_minio.yml
│   │   ├── playbook_nginx_coolify_lb.yml
│   │   ├── playbook_nginx_minio_lb.yml
│   │   └── playbook_psql.yml
│   ├── ansible.cfg
│   └── requirements.yml
├── terraform-hetzner/
│   ├── load_balancer.tf
│   ├── main.tf
│   ├── network.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── ssh.tf
│   ├── terraform.tfstate
│   ├── terraform.tfstate.backup
│   └── variables.tf
├── LICENSE
└── README.md
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "minio"
        }
      + location                   = "fsn1"
      + name                       = "minio-3"
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

  # hcloud_server.minio_lb[0] will be created
  + resource "hcloud_server" "minio_lb" {
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
          + "type" = "minio-lb"
        }
      + location                   = "fsn1"
      + name                       = "minio-lb-0"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx21"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)
    }

  # hcloud_server.nginx_lb[0] will be created
  + resource "hcloud_server" "nginx_lb" {
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
          + "type" = "nginx-lb"
        }
      + location                   = "fsn1"
      + name                       = "nginx-lb-0"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx11"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)
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

  # hcloud_server.services[0] will be created
  + resource "hcloud_server" "services" {
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
          + "type" = "services"
        }
      + location                   = "fsn1"
      + name                       = "services-0"
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

  # hcloud_server.services[1] will be created
  + resource "hcloud_server" "services" {
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
          + "type" = "services"
        }
      + location                   = "nbg1"
      + name                       = "services-1"
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

  # hcloud_server_network.db_subnet[0] will be created
  + resource "hcloud_server_network" "db_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.3.2"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.deployment_subnet_controler[0] will be created
  + resource "hcloud_server_network" "deployment_subnet_controler" {
      + id          = (known after apply)
      + ip          = "10.0.1.6"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.deployment_subnet_lb[0] will be created
  + resource "hcloud_server_network" "deployment_subnet_lb" {
      + id          = (known after apply)
      + ip          = "10.0.1.7"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.deployment_subnet_minio_lb[0] will be created
  + resource "hcloud_server_network" "deployment_subnet_minio_lb" {
      + id          = (known after apply)
      + ip          = "10.0.4.7"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.deployment_subnet_worker[0] will be created
  + resource "hcloud_server_network" "deployment_subnet_worker" {
      + id          = (known after apply)
      + ip          = "10.0.1.2"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.deployment_subnet_worker[1] will be created
  + resource "hcloud_server_network" "deployment_subnet_worker" {
      + id          = (known after apply)
      + ip          = "10.0.1.3"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.deployment_subnet_worker[2] will be created
  + resource "hcloud_server_network" "deployment_subnet_worker" {
      + id          = (known after apply)
      + ip          = "10.0.1.4"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.deployment_subnet_worker[3] will be created
  + resource "hcloud_server_network" "deployment_subnet_worker" {
      + id          = (known after apply)
      + ip          = "10.0.1.5"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.minio_subnet[0] will be created
  + resource "hcloud_server_network" "minio_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.4.2"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.minio_subnet[1] will be created
  + resource "hcloud_server_network" "minio_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.4.3"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.minio_subnet[2] will be created
  + resource "hcloud_server_network" "minio_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.4.4"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.minio_subnet[3] will be created
  + resource "hcloud_server_network" "minio_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.4.5"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.services_subnet[0] will be created
  + resource "hcloud_server_network" "services_subnet" {
      + id          = (known after apply)
      + ip          = "10.0.2.2"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # hcloud_server_network.services_subnet[1] will be created
  + resource "hcloud_server_network" "services_subnet" {
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

  # hcloud_volume.minio_volume[0] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "fsn1"
      + name              = "drive-1"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[1] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "nbg1"
      + name              = "drive-2"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[2] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "hel1"
      + name              = "drive-3"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[3] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "fsn1"
      + name              = "drive-4"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[4] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "fsn1"
      + name              = "drive-5"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[5] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "nbg1"
      + name              = "drive-6"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[6] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "hel1"
      + name              = "drive-7"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[7] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "fsn1"
      + name              = "drive-8"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[8] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "fsn1"
      + name              = "drive-9"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[9] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "nbg1"
      + name              = "drive-10"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[10] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "hel1"
      + name              = "drive-11"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[11] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "fsn1"
      + name              = "drive-12"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[12] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "fsn1"
      + name              = "drive-13"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[13] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "nbg1"
      + name              = "drive-14"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[14] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "hel1"
      + name              = "drive-15"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume.minio_volume[15] will be created
  + resource "hcloud_volume" "minio_volume" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "fsn1"
      + name              = "drive-16"
      + server_id         = (known after apply)
      + size              = 10
    }

  # hcloud_volume_attachment.minio_vol_attachment[0] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[1] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[2] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[3] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[4] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[5] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[6] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[7] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[8] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[9] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[10] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[11] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[12] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[13] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[14] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # hcloud_volume_attachment.minio_vol_attachment[15] will be created
  + resource "hcloud_volume_attachment" "minio_vol_attachment" {
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

Plan: 67 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + public_key    = (known after apply)
  + server_ips    = {
      + coolify_controler = {
          + coolify-controler-0 = (known after apply)
        }
      + coolify_worker    = {
          + coolify-worker-0 = (known after apply)
          + coolify-worker-1 = (known after apply)
          + coolify-worker-2 = (known after apply)
          + coolify-worker-3 = (known after apply)
        }
      + minio             = {
          + minio-0 = (known after apply)
          + minio-1 = (known after apply)
          + minio-2 = (known after apply)
          + minio-3 = (known after apply)
        }
      + minio_lb          = {
          + minio-lb-0 = (known after apply)
        }
      + nginx_lb          = {
          + nginx-lb-0 = (known after apply)
        }
      + postgres_db       = {
          + postgres-0 = (known after apply)
        }
      + services          = {
          + services-0 = (known after apply)
          + services-1 = (known after apply)
        }
    }
  + server_status = {
      + coolify_controler = {
          + coolify-controler-0 = (known after apply)
        }
      + coolify_worker    = {
          + coolify-worker-0 = (known after apply)
          + coolify-worker-1 = (known after apply)
          + coolify-worker-2 = (known after apply)
          + coolify-worker-3 = (known after apply)
        }
      + minio             = {
          + minio-0 = (known after apply)
          + minio-1 = (known after apply)
          + minio-2 = (known after apply)
          + minio-3 = (known after apply)
        }
      + minio_lb          = {
          + minio-lb-0 = (known after apply)
        }
      + nginx_lb          = {
          + nginx-lb-0 = (known after apply)
        }
      + postgres_db       = {
          + postgres-0 = (known after apply)
        }
      + services          = {
          + services-0 = (known after apply)
          + services-1 = (known after apply)
        }
    }

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

hcloud_network.network: Creating...
tls_private_key.ssh_key: Creating...
tls_private_key.ssh_key: Creation complete after 1s [id=c35da5e74082be398b764cfc148bca63432177f7]
hcloud_ssh_key.default: Creating...
hcloud_ssh_key.default: Creation complete after 1s [id=20068431]
hcloud_network.network: Creation complete after 2s [id=4021674]
hcloud_network_subnet.deployment_subnet: Creating...
hcloud_network_subnet.db_subnet: Creating...
hcloud_network_subnet.minio_subnet: Creating...
hcloud_network_subnet.services_subnet: Creating...
hcloud_network_subnet.minio_subnet: Creation complete after 2s [id=4021674-10.0.4.0/24]
hcloud_network_subnet.services_subnet: Creation complete after 2s [id=4021674-10.0.2.0/24]
hcloud_network_subnet.db_subnet: Creation complete after 2s [id=4021674-10.0.3.0/24]
hcloud_network_subnet.deployment_subnet: Creation complete after 3s [id=4021674-10.0.1.0/24]
hcloud_server.coolify_controler[0]: Creating...
hcloud_server.coolify_controler[0]: Still creating... [10s elapsed]
hcloud_server.coolify_controler[0]: Provisioning with 'local-exec'...
hcloud_server.coolify_controler[0] (local-exec): (output suppressed due to sensitive value in config)
hcloud_server.coolify_controler[0]: Creation complete after 14s [id=44837567]
hcloud_server_network.deployment_subnet_controler[0]: Creating...
hcloud_server.coolify_worker[1]: Creating...
hcloud_server.minio[2]: Creating...
hcloud_server.services[1]: Creating...
hcloud_server.postgres_db[0]: Creating...
hcloud_server.services[0]: Creating...
hcloud_server.coolify_worker[2]: Creating...
hcloud_server.coolify_worker[3]: Creating...
hcloud_server.minio[3]: Creating...
hcloud_server.minio[0]: Creating...
hcloud_server_network.deployment_subnet_controler[0]: Still creating... [10s elapsed]
hcloud_server.minio[2]: Still creating... [10s elapsed]
hcloud_server.coolify_worker[1]: Still creating... [10s elapsed]
hcloud_server.postgres_db[0]: Still creating... [10s elapsed]
hcloud_server.services[1]: Still creating... [10s elapsed]
hcloud_server.services[0]: Still creating... [10s elapsed]
hcloud_server.coolify_worker[3]: Still creating... [10s elapsed]
hcloud_server.coolify_worker[2]: Still creating... [10s elapsed]
hcloud_server.minio[3]: Still creating... [10s elapsed]
hcloud_server.minio[0]: Still creating... [10s elapsed]
hcloud_server.minio[2]: Creation complete after 12s [id=44837569]
hcloud_server.minio[1]: Creating...
hcloud_server.coolify_worker[2]: Creation complete after 14s [id=44837568]
hcloud_server.coolify_worker[0]: Creating...
hcloud_server.minio[0]: Creation complete after 14s [id=44837571]
hcloud_server.coolify_worker[1]: Creation complete after 15s [id=44837570]
hcloud_server.services[0]: Creation complete after 15s [id=44837573]
hcloud_server.services[1]: Creation complete after 15s [id=44837575]
hcloud_server_network.services_subnet[1]: Creating...
hcloud_server_network.services_subnet[0]: Creating...
hcloud_server.minio[3]: Creation complete after 15s [id=44837576]
hcloud_server.coolify_worker[3]: Creation complete after 15s [id=44837572]
hcloud_server.postgres_db[0]: Creation complete after 17s [id=44837574]
hcloud_server_network.db_subnet[0]: Creating...
hcloud_server_network.deployment_subnet_controler[0]: Creation complete after 18s [id=44837567-4021674]
hcloud_server_network.services_subnet[1]: Creation complete after 4s [id=44837575-4021674]
hcloud_server_network.db_subnet[0]: Creation complete after 3s [id=44837574-4021674]
hcloud_server.minio[1]: Still creating... [10s elapsed]
hcloud_server.coolify_worker[0]: Still creating... [10s elapsed]
hcloud_server_network.services_subnet[0]: Still creating... [10s elapsed]
hcloud_server.coolify_worker[0]: Creation complete after 12s [id=44837580]
hcloud_server_network.deployment_subnet_worker[3]: Creating...
hcloud_server_network.deployment_subnet_worker[0]: Creating...
hcloud_server_network.deployment_subnet_worker[2]: Creating...
hcloud_server_network.deployment_subnet_worker[1]: Creating...
hcloud_server.nginx_lb[0]: Creating...
hcloud_server.minio[1]: Creation complete after 15s [id=44837581]
hcloud_server_network.minio_subnet[1]: Creating...
hcloud_server_network.minio_subnet[3]: Creating...
hcloud_server_network.minio_subnet[0]: Creating...
hcloud_server.minio_lb[0]: Creating...
hcloud_server_network.deployment_subnet_worker[3]: Creation complete after 2s [id=44837572-4021674]
hcloud_server_network.minio_subnet[2]: Creating...
hcloud_server_network.deployment_subnet_worker[1]: Creation complete after 3s [id=44837570-4021674]
hcloud_volume.minio_volume[8]: Creating...
hcloud_server_network.minio_subnet[1]: Creation complete after 4s [id=44837581-4021674]
hcloud_volume.minio_volume[0]: Creating...
hcloud_server_network.deployment_subnet_worker[2]: Creation complete after 6s [id=44837568-4021674]
hcloud_volume.minio_volume[2]: Creating...
hcloud_server_network.minio_subnet[0]: Creation complete after 5s [id=44837571-4021674]
hcloud_volume.minio_volume[15]: Creating...
hcloud_volume.minio_volume[8]: Creation complete after 5s [id=100486556]
hcloud_volume.minio_volume[11]: Creating...
hcloud_server_network.services_subnet[0]: Creation complete after 19s [id=44837573-4021674]
hcloud_volume.minio_volume[14]: Creating...
hcloud_server_network.minio_subnet[3]: Creation complete after 8s [id=44837576-4021674]
hcloud_volume.minio_volume[1]: Creating...
hcloud_server_network.deployment_subnet_worker[0]: Still creating... [10s elapsed]
hcloud_server.nginx_lb[0]: Still creating... [10s elapsed]
hcloud_server_network.minio_subnet[2]: Creation complete after 8s [id=44837569-4021674]
hcloud_volume.minio_volume[6]: Creating...
hcloud_server.nginx_lb[0]: Creation complete after 11s [id=44837584]
hcloud_volume.minio_volume[4]: Creating...
hcloud_server.minio_lb[0]: Still creating... [10s elapsed]
hcloud_volume.minio_volume[0]: Creation complete after 6s [id=100486557]
hcloud_volume.minio_volume[9]: Creating...
hcloud_volume.minio_volume[15]: Creation complete after 6s [id=100486558]
hcloud_volume.minio_volume[10]: Creating...
hcloud_volume.minio_volume[2]: Creation complete after 8s [id=100486559]
hcloud_volume.minio_volume[13]: Creating...
hcloud_volume.minio_volume[14]: Creation complete after 6s [id=100486561]
hcloud_volume.minio_volume[7]: Creating...
hcloud_volume.minio_volume[11]: Creation complete after 6s [id=100486560]
hcloud_volume.minio_volume[3]: Creating...
hcloud_volume.minio_volume[1]: Creation complete after 5s [id=100486562]
hcloud_volume.minio_volume[5]: Creating...
hcloud_volume.minio_volume[6]: Creation complete after 6s [id=100486563]
hcloud_volume.minio_volume[12]: Creating...
hcloud_server_network.deployment_subnet_worker[0]: Creation complete after 16s [id=44837580-4021674]
hcloud_server_network.deployment_subnet_lb[0]: Creating...
hcloud_volume.minio_volume[4]: Creation complete after 5s [id=100486564]
hcloud_volume.minio_volume[10]: Creation complete after 4s [id=100486566]
hcloud_volume.minio_volume[9]: Creation complete after 7s [id=100486565]
hcloud_server.minio_lb[0]: Creation complete after 17s [id=44837585]
hcloud_server_network.deployment_subnet_minio_lb[0]: Creating...
hcloud_volume.minio_volume[5]: Creation complete after 5s [id=100486569]
hcloud_volume.minio_volume[13]: Creation complete after 6s [id=100486568]
hcloud_volume.minio_volume[3]: Creation complete after 6s [id=100486570]
hcloud_volume.minio_volume[7]: Creation complete after 6s [id=100486567]
hcloud_server_network.deployment_subnet_minio_lb[0]: Creation complete after 4s [id=44837585-4021674]
hcloud_volume.minio_volume[12]: Creation complete after 6s [id=100486571]
hcloud_volume_attachment.minio_vol_attachment[4]: Creating...
hcloud_volume_attachment.minio_vol_attachment[3]: Creating...
hcloud_volume_attachment.minio_vol_attachment[14]: Creating...
hcloud_volume_attachment.minio_vol_attachment[12]: Creating...
hcloud_volume_attachment.minio_vol_attachment[15]: Creating...
hcloud_volume_attachment.minio_vol_attachment[2]: Creating...
hcloud_volume_attachment.minio_vol_attachment[7]: Creating...
hcloud_volume_attachment.minio_vol_attachment[11]: Creating...
hcloud_volume_attachment.minio_vol_attachment[5]: Creating...
hcloud_server_network.deployment_subnet_lb[0]: Still creating... [10s elapsed]
hcloud_server_network.deployment_subnet_lb[0]: Creation complete after 10s [id=44837584-4021674]
hcloud_volume_attachment.minio_vol_attachment[9]: Creating...
hcloud_volume_attachment.minio_vol_attachment[15]: Creation complete after 5s [id=100486558]
hcloud_volume_attachment.minio_vol_attachment[0]: Creating...
hcloud_volume_attachment.minio_vol_attachment[2]: Creation complete after 6s [id=100486559]
hcloud_volume_attachment.minio_vol_attachment[8]: Creating...
hcloud_volume_attachment.minio_vol_attachment[5]: Creation complete after 6s [id=100486569]
hcloud_volume_attachment.minio_vol_attachment[1]: Creating...
hcloud_volume_attachment.minio_vol_attachment[11]: Creation complete after 6s [id=100486560]
hcloud_volume_attachment.minio_vol_attachment[13]: Creating...
hcloud_volume_attachment.minio_vol_attachment[3]: Creation complete after 6s [id=100486570]
hcloud_volume_attachment.minio_vol_attachment[6]: Creating...
hcloud_volume_attachment.minio_vol_attachment[12]: Creation complete after 7s [id=100486571]
hcloud_volume_attachment.minio_vol_attachment[10]: Creating...
hcloud_volume_attachment.minio_vol_attachment[4]: Creation complete after 7s [id=100486564]
hcloud_volume_attachment.minio_vol_attachment[7]: Creation complete after 7s [id=100486567]
hcloud_volume_attachment.minio_vol_attachment[14]: Creation complete after 8s [id=100486561]
hcloud_volume_attachment.minio_vol_attachment[9]: Creation complete after 5s [id=100486565]
hcloud_volume_attachment.minio_vol_attachment[1]: Creation complete after 6s [id=100486562]
hcloud_volume_attachment.minio_vol_attachment[0]: Creation complete after 7s [id=100486557]
hcloud_volume_attachment.minio_vol_attachment[13]: Creation complete after 6s [id=100486568]
hcloud_volume_attachment.minio_vol_attachment[8]: Creation complete after 7s [id=100486556]
hcloud_volume_attachment.minio_vol_attachment[10]: Creation complete after 6s [id=100486566]
hcloud_volume_attachment.minio_vol_attachment[6]: Creation complete after 8s [id=100486563]

Apply complete! Resources: 67 added, 0 changed, 0 destroyed.

Outputs:

public_key = <<EOT
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDlAV3wdrgSxQNCu8dCCY2NeW/DHIlpgYGoyNXD+YqG+yS2KM1ntmPqZFmXXw3risZclq9e5f++4jpqcdWKCaiIITx52Kzk6/MVj9e+UaYgPvsyBGhM7/tzXaZz8kOz0YkGboDwpjY7oWjl2va02/JOK/nVYdFZ7lfZiUejux/pQkN8xJAiI7x/72cr3GAaOB6ySQ1U3nfR7eypyCoJyzS0VfXLc3ONJ82RpUppE1WncFJokFgTagO3qhF3eMiGxrR5L7D/EV15QTkRtdKsckeNpK0t3ZjBGE1xzeBkw4yNEwhN/JcU/+zVT54McksTlY7BJnLOUqdFE0LM0fVFXbNU3EUvIf+yHewi41LuHxY5TSkK4CDZomNG5ECafjreD+ztzSfaNoIQ3UpQBMbzvZEUMXzezUCDHXEdC+5f5xdUp83URt9dRQ1zuuCnqbfFcasVyCif6uL/DJTgU+PytflBGDldk5THvAZz3G6oCBtR03N0cZajh3xtaNmpAAYCzsMEAnIw2v9EVs/JNJJrZSOjTK2n82xev+4563o5GQrZNCRh2X3WXuIhl4ERkYiLcRwniOxiXJJ15zvvgQXjsHx8lZUiew07F/FoQqnUBQVMFzYL2YQaBUNZLWnBFE1eNlOpCZCj3RqFeeKg0V9ZTtLEQBOmRXg09DdPWUkf/Jc02Q==

EOT
server_ips = {
  "coolify_controler" = {
    "coolify-controler-0" = "167.235.253.176"
  }
  "coolify_worker" = {
    "coolify-worker-0" = "157.90.252.123"
    "coolify-worker-1" = "168.119.165.118"
    "coolify-worker-2" = "65.109.2.124"
    "coolify-worker-3" = "49.13.126.247"
  }
  "minio" = {
    "minio-0" = "91.107.198.134"
    "minio-1" = "49.13.167.104"
    "minio-2" = "65.109.141.80"
    "minio-3" = "159.69.241.156"
  }
  "minio_lb" = {
    "minio-lb-0" = "157.90.150.92"
  }
  "nginx_lb" = {
    "nginx-lb-0" = "167.235.243.221"
  }
  "postgres_db" = {
    "postgres-0" = "88.198.111.144"
  }
  "services" = {
    "services-0" = "168.119.101.156"
    "services-1" = "167.235.30.10"
  }
}
server_status = {
  "coolify_controler" = {
    "coolify-controler-0" = "running"
  }
  "coolify_worker" = {
    "coolify-worker-0" = "running"
    "coolify-worker-1" = "running"
    "coolify-worker-2" = "running"
    "coolify-worker-3" = "running"
  }
  "minio" = {
    "minio-0" = "running"
    "minio-1" = "running"
    "minio-2" = "running"
    "minio-3" = "running"
  }
  "minio_lb" = {
    "minio-lb-0" = "running"
  }
  "nginx_lb" = {
    "nginx-lb-0" = "running"
  }
  "postgres_db" = {
    "postgres-0" = "running"
  }
  "services" = {
    "services-0" = "running"
    "services-1" = "running"
  }
}
```
