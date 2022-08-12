resource "yandex_compute_instance" "monitoring" {
  name = "monitoring"
  zone = "ru-central1-a"
  hostname = "${var.instance_monitoring}"
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
    ip_address = "${var.monitoring_ip}"
    nat = false
  }

  metadata = {
    ssh-keys = "centos:${file(var.key_pub)}"
  }
}
