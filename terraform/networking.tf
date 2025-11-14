data "yandex_vpc_network" "app_network" {
  name = "default"
}

data "yandex_vpc_subnet" "app_subnet" {
  name = "default-ru-central1-a"
}