variable "token" {
  type      = string
  sensitive = true
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "app_name" {
  type    = string
  default = "crawler-app"
}

variable "ssh_key" {
  type = string
}

variable "postgres_password" {
  type      = string
  sensitive = true
}

variable "postgres_user" {
  type    = string
  default = "appuser"
}

variable "postgres_db" {
  type    = string
  default = "appdb"
}