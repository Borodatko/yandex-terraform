resource "local_file" "inventory" {
  content = <<-DOC

    [netology]
    nginx ansible_host=${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}


    DOC
  filename = "src/ansible/inventory"

  depends_on = [
    yandex_compute_instance.nginx,
  ]
}

