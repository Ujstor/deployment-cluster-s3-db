resource "hcloud_network" "network" {
  name     = "network"
  ip_range = "10.0.0.0/16"
}


resource "hcloud_network_subnet" "network-subnet" {
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24" 
}
