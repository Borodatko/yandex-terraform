resource "yandex_compute_instance" "nat" {
  name = "nat"
  zone = "ru-central1-a"
  hostname = "nat"
  allow_stopping_for_update = true

  resources {
    cores = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "${var.nat}"
      name = "root-nat"
      type = "network-nvme"
      size = "15"
    }
  }	

  network_interface {
    subnet_id = "${yandex_vpc_subnet.external.id}"
    ip_address = "${var.nat_ext_ip}"
    nat = true
  }

  metadata = {
    ssh-keys = "centos:${file(var.key_pub)}"
  }
}
