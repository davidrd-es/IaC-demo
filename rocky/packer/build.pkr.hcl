build {
  sources = [
    "nutanix.rocky"
  ]
  
  provisioner "shell" {
    only = ["nutanix.rocky"]
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "ls", #"yum install cloud-init -y",
      "ls" #"systemctl enable cloud-init"
    ]
  }
  provisioner "shell" {
    only = ["nutanix.rocky"]
    script = "${path.cwd}/rocky/packer/scripts/cleanUp.sh"
  }
}