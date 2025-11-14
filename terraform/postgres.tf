resource "yandex_mdb_postgresql_cluster" "app_db_cluster" {
  name        = "${var.app_name}-pg"
  environment = "PRODUCTION"
  network_id  = data.yandex_vpc_network.app_network.id

  config {
    version = "14"
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = 16
    }
  }

  host {
    zone      = var.zone
    subnet_id = data.yandex_vpc_subnet.app_subnet.id
  }
}

resource "yandex_mdb_postgresql_database" "app_database" {
  cluster_id = yandex_mdb_postgresql_cluster.app_db_cluster.id
  name       = var.postgres_db
  owner      = yandex_mdb_postgresql_user.app_db_user.name
}

resource "yandex_mdb_postgresql_user" "app_db_user" {
  cluster_id = yandex_mdb_postgresql_cluster.app_db_cluster.id
  name       = var.postgres_user
  password   = var.postgres_password
}