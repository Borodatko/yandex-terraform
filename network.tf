resource "yandex_vpc_network" "net" {
  name = "net"
}

resource "yandex_vpc_route_table" "nat" {
  network_id = "${yandex_vpc_network.net.id}"

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.1.254"
  }
}

resource "yandex_vpc_subnet" "internal" {
  name = "internal"
  zone = "ru-central1-a"
  network_id = "${yandex_vpc_network.net.id}"
  v4_cidr_blocks = ["10.20.100.0/24"]
  route_table_id = "${yandex_vpc_route_table.nat.id}"
}

resource "yandex_vpc_subnet" "external" {
  name = "external"
  zone = "ru-central1-b"
  network_id = "${yandex_vpc_network.net.id}"
  v4_cidr_blocks = ["192.168.1.0/24"]
}

