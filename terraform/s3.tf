resource "yandex_storage_bucket" "app_bucket" {
  bucket     = "${var.app_name}-data-${random_id.unique.hex}"
  access_key = yandex_iam_service_account_static_access_key.sa_static_key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_static_key.secret_key
}