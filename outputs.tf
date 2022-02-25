# terraform output でここに定義した値を名前と結びつけて表示することができる

output "ip" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}