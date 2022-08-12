resource "yandex_compute_instance" "monitoring" {
  name = "monitoring"
  zone = "ru-central1-a"
  hostname = "monitoring.${var.domain}"
  allow_stopping_for_update = true

  resources {
    cores = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "${var.centos-7-base}"
      name = "root-monitoring"
      type = "network-nvme"
      size = "15"
    }
  }	

  network_interface {
    subnet_id = "${yandex_vpc_subnet.internal.id}"
    nat = false
  }

  metadata = {
    ssh-keys = "centos:${file("id_rsa.pub")}"
  }
}
