variable "hcloud_token" {
  type        = string
  description = "Hetzner Cloud API token"
  sensitive   = true
  default     = "<API_TOKEN>"
}

variable "location_list" {
  type        = list(string)
  description = "List of locations to cycle through"
  default     = ["fsn1", "nbg1", "hel1"]
}

variable "instances_lb" {
  type        = string
  description = "Number of instances to create"
  default     = "1"
}

variable "instances_minio_lb" {
  type        = string
  description = "Number of instances to create"
  default     = "1"
}

variable "instances_coolify_controler" {
  type        = string
  description = "Number of instances to create"
  default     = "1"
}

variable "instances_coolify_worker" {
  type        = string
  description = "Number of instances to create"
  default     = "4"
}

variable "instances_db" {
  type        = string
  description = "Number of instances to create"
  default     = "1"
}

variable "instances_services" {
  type        = string
  description = "Number of instances to create"
  default     = "2"
}

variable "instances_minio" {
  type        = string
  description = "Number of instances to create"
  default     = "4"
}


variable "server_type_coolify_controler" {
  type        = string
  description = "Server type to use for deployment master node"
  default     = "cx11"
}

variable "server_type_coolify_worker" {
  type        = string
  description = "Server type to use for deployment"
  default     = "cx21"
}

variable "server_type_db" {
  type        = string
  description = "Server type to use for db"
  default     = "cx41"
}

variable "server_type_services" {
  type        = string
  description = "Server type to use for utils"
  default     = "cx21"
}

variable "server_type_minio" {
  type        = string
  description = "Server type to use for backup"
  default     = "cx21"
}

variable "os_type" {
  type        = string
  description = "OS image to use for the server"
  default     = "ubuntu-22.04"
}

variable "disk_size" {
  type        = string
  description = "Disk size to use for the backup server"
  default     = "10"
}


variable "volumes_per_node" {
  type        = string
  description = "Load balancer port"
  default     = "4"
}

variable "public_net" {
  type = bool
  description = "Public network enabled or desabled for all servers besides master_node and backup"
  default = true
}