data "yandex_compute_image" "base_image" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "app_server" {
  name     = "${var.app_name}-server"
  zone     = var.zone
  hostname = "${var.app_name}-server"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.base_image.id
      size     = 20
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.app_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }

  service_account_id = yandex_iam_service_account.app_sa.id
}