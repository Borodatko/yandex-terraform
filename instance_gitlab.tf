resource "yandex_compute_instance" "gitlab" {
  name = "gitlab"
  zone = "ru-central1-a"
  hostname = "${var.instance_gitlab}"
  allow_stopping_for_update = true

  resources {
    cores = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = "${var.centos-7-base}"
      name = "root-gitlab"
      type = "network-nvme"
      size = "15"
    }
  }	

  network_interface {
    subnet_id = "${yandex_vpc_subnet.internal.id}"
    ip_address = "${var.gitlab_ip}"
    nat = false
  }

  metadata = {
    ssh-keys = "centos:${file(var.key_pub)}"
  }
}
