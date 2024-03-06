locals {
  available_ip_resource = [for num in range(2, 254) : cidrhost(hcloud_network_subnet.resource_subnet.ip_range, num)]
  available_ip_deploymet = [for num in range(2, 254) : cidrhost(hcloud_network_subnet.deployment_subnet.ip_range, num)]
  available_ip_dbbackup = [for num in range(2, 254) : cidrhost(hcloud_network_subnet.db_backup_subnet.ip_range, num)]
}

resource "hcloud_network" "network" {
  name     = "network"
  ip_range = "10.0.0.0/16"
}

#### Deployment Subnet
resource "hcloud_network_subnet" "deployment_subnet" {
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_server_network" "deployment_subnet" {
  count     = var.instances_coolify_node
  server_id = hcloud_server.coolify_node[count.index].id
  subnet_id = hcloud_network_subnet.deployment_subnet.id
  ip        = local.available_ip_deploymet[count.index]
}

resource "hcloud_server_network" "deployment_subnet_master" {
  count     = var.instances_coolify_master
  server_id = hcloud_server.coolify_master[count.index].id
  subnet_id = hcloud_network_subnet.deployment_subnet.id 
  ip        = local.available_ip_deploymet[count.index + var.instances_coolify_node]
}

#### Resource Subnet
resource "hcloud_network_subnet" "resource_subnet" {
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.2.0/24"
}

resource "hcloud_server_network" "utils_subnet" {
  count     = var.instances_utils
  server_id = hcloud_server.utils[count.index].id
  subnet_id = hcloud_network_subnet.resource_subnet.id
  ip        = local.available_ip_resource[count.index]
}

### DB-Backup Subnet
resource "hcloud_network_subnet" "db_backup_subnet" {
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.3.0/24"
}


resource "hcloud_server_network" "db_subnet" {
  count     = var.instances_db
  server_id = hcloud_server.postgres_db[count.index].id
  subnet_id = hcloud_network_subnet.db_backup_subnet.id
  ip        = local.available_ip_dbbackup[count.index]
}

resource "hcloud_server_network" "backup_subnet" {
  count     = var.instances_backup
  server_id = hcloud_server.backup[count.index].id
  subnet_id = hcloud_network_subnet.db_backup_subnet.id
  ip        = local.available_ip_dbbackup[count.index + var.instances_db]
}
