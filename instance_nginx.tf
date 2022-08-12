resource "yandex_compute_instance" "nginx" {
  name = "nginx"
  zone = "ru-central1-a"
  hostname = "${var.domain}"
  allow_stopping_for_update = true

  resources {
    cores = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "${var.centos-7-base}"
      name = "root-nginx"
      type = "network-nvme"
      size = "15"
    }
  }	

  network_interface {
    subnet_id = "${yandex_vpc_subnet.internal.id}"
    nat = true
  }

  metadata = {
    ssh-keys = "centos:${file("id_rsa.pub")}"
  }
}
