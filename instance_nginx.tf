resource "yandex_compute_instance" "nginx" {
  name = "nginx"
  zone = "ru-central1-a"
  hostname = "${var.instance_nginx}"
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
    ip_address = "${var.nginx_int_ip}"
    nat = true
  }

  metadata = {
    ssh-keys = "centos:${file(var.key_pub)}"
  }
}
