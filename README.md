Terraform CentOS7 Yandex Cloud
==============================

Terraform CentOS 7 template build for Yandex Cloud


Provider.tf
-----------

Next variable must be changed in provider.tf

- organization
- name

Example:

```
  cloud {
    organization = "CHANGEME"
    hostname = "app.terraform.io"
    workspaces {
      name = "CHANGEME"
    }
  }
```

Variables
---------

| Name | Description | Type | Default Value |
|------|-------------|------|---------------|
| yandex_cloud_id | ID of the cloud | string | CHANGEME |
| yandex_folder_id | ID of the folder | string | CHANGEME |
| centos-7-base | ID of the CentOS image | string | CHANGEME |
| nat | ID of the NAT image | string | CHANGEME |
| domain | domain name | string | CHANGEME |
| nat_ext_ip | ip address of nat subnet | string | 192.168.1.254 |
