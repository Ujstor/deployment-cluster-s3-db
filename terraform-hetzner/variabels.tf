variable "hcloud_token" {
  type        = string
  description = "Hetzner Cloud API token"
  sensitive   = true
  default     = "<API_TOKEN>"
}

variable "location" {
  type        = string
  description = "Location to create the server's in"
  default     = "fsn1"
}

variable "instances_coolify" {
  type        = string
  description = "Number of instances to create"
  default     = "2"
}

variable "instances_db" {
  type        = string
  description = "Number of instances to create"
  default     = "1"
}

variable "instances_utils" {
  type        = string
  description = "Number of instances to create"
  default     = "2"
}

variable "instances_backup" {
  type        = string
  description = "Number of instances to create"
  default     = "1"
}

variable "server_type_coolify" {
  type        = string
  description = "Server type to use for deployment"
  default     = "cx21"
}

variable "server_type_db" {
  type        = string
  description = "Server type to use for db"
  default     = "cx41"
}

variable "server_type_utils" {
  type        = string
  description = "Server type to use for utils"
  default     = "cx21"
}

variable "server_type_backup" {
  type        = string
  description = "Server type to use for backup"
  default     = "cx31"
}

variable "os_type" {
  type        = string
  description = "OS image to use for the server"
  default     = "debian-12"
}

variable "http_protocol" {
  default = "http"
}

variable "http_port" {
  default = "80"
}