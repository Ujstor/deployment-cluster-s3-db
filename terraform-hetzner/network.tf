locals {
  available_ip_deploymet = [for num in range(2, 254) : cidrhost(hcloud_network_subnet.deployment_subnet.ip_range, num)]
  available_ip_services = [for num in range(2, 254) : cidrhost(hcloud_network_subnet.services_subnet.ip_range, num)]
  available_ip_db = [for num in range(2, 254) : cidrhost(hcloud_network_subnet.db_subnet.ip_range, num)]
  available_ip_minio = [for num in range(2, 254) : cidrhost(hcloud_network_subnet.minio_subnet.ip_range, num)]
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

resource "hcloud_server_network" "deployment_subnet_worker" {
  count     = var.instances_coolify_worker
  server_id = hcloud_server.coolify_worker[count.index].id
  subnet_id = hcloud_network_subnet.deployment_subnet.id
  ip        = local.available_ip_deploymet[count.index]
}

resource "hcloud_server_network" "deployment_subnet_controler" {
  count     = var.instances_coolify_controler
  server_id = hcloud_server.coolify_controler[count.index].id
  subnet_id = hcloud_network_subnet.deployment_subnet.id 
  ip        = local.available_ip_deploymet[count.index + var.instances_coolify_worker]
}

#### Services Subnet
resource "hcloud_network_subnet" "services_subnet" {
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.2.0/24"
}

resource "hcloud_server_network" "services_subnet" {
  count     = var.instances_services
  server_id = hcloud_server.services[count.index].id
  subnet_id = hcloud_network_subnet.services_subnet.id
  ip        = local.available_ip_services[count.index]
}

### DB Subnet
resource "hcloud_network_subnet" "db_subnet" {
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.3.0/24"
}


resource "hcloud_server_network" "db_subnet" {
  count     = var.instances_db
  server_id = hcloud_server.postgres_db[count.index].id
  subnet_id = hcloud_network_subnet.db_subnet.id
  ip        = local.available_ip_db[count.index]
}

### MinIO Subnet
resource "hcloud_network_subnet" "minio_subnet" {
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.4.0/24"
}

resource "hcloud_server_network" "minio_subnet" {
  count     = var.instances_minio
  server_id = hcloud_server.minio[count.index].id
  subnet_id = hcloud_network_subnet.minio_subnet.id
  ip        = local.available_ip_minio[count.index]
}