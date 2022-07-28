resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 20"
  }

  depends_on = [
    local_file.inventory
  ]
}

resource "null_resource" "nginx" {
  provisioner "local-exec" {
    command = "bash ANSIBLE_FORCE_COLOR=1 ansible-playbook -i src/ansible/inventory src/ansible/provision.yml"
  }

  depends_on = [
    null_resource.wait
  ]
}

