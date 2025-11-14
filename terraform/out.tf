output "vm_ip" {
  value = yandex_compute_instance.app_server.network_interface[0].nat_ip_address
}

output "db_fqdn" {
  value = yandex_mdb_postgresql_cluster.app_db_cluster.host[0].fqdn
}

output "bucket_name" {
  value = yandex_storage_bucket.app_bucket.bucket
}

output "s3_access_key" {
  value     = yandex_iam_service_account_static_access_key.sa_static_key.access_key
  sensitive = true
}

output "s3_secret_key" {
  value     = yandex_iam_service_account_static_access_key.sa_static_key.secret_key
  sensitive = true
}