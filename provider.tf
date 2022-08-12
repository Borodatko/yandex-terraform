terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  cloud {
    organization = "${var.org_name}"
    hostname = "app.terraform.io"
    workspaces {
      name = "${var.workspace_name}"
    }
  }
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
}
