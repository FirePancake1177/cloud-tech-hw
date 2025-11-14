resource "yandex_iam_service_account" "app_sa" {
  name = "${var.app_name}-account"
}

resource "yandex_resourcemanager_folder_iam_member" "sa_editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.app_sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa_static_key" {
  service_account_id = yandex_iam_service_account.app_sa.id
}