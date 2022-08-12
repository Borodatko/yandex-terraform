resource "yandex_compute_instance" "db02" {
  name = "db02"
  zone = "ru-central1-a"
  hostname = "db02.${var.domain}"
  allow_stopping_for_update = true

  resources {
    cores = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "${var.centos-7-base}"
      name = "root-db02"
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
