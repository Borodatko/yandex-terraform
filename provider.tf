terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  cloud {
    organization = "CHANGEME"
    hostname = "app.terraform.io"
    workspaces {
      name = "CHANGEME"
    }
  }
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
}
