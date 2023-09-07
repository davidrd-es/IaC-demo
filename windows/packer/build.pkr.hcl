build {
  sources = [
    "nutanix.windows"
  ]

  provisioner "powershell" {
    only = ["nutanix.windows"]
    scripts = ["./windows/packer/scripts/01-install-pwsh-modules.ps1"]
    pause_before = "2m"
    elevated_user = "Administrator"
    elevated_password =var.win_password 
  }

  provisioner "powershell" {
    only = ["nutanix.windows"]
    scripts = ["./windows/packer/scripts/windowsUpdate.ps1"]
    pause_before = "2m"
    elevated_user = "Administrator"
    elevated_password =var.win_password 
  }

  provisioner "windows-restart" {
    only = ["nutanix.windows"]
    restart_timeout = "30m"
  }

  provisioner "powershell" {
    only = ["nutanix.windows"]
    scripts = ["./windows/packer/scripts/windowsUpdate.ps1"]
    pause_before = "2m"
    elevated_user = "Administrator"
    elevated_password =var.win_password 
  }

  provisioner "windows-restart" {
    only = ["nutanix.windows"]
    restart_timeout = "30m"
  }

  provisioner "powershell" {
    only = ["nutanix.windows"]
    scripts = ["./windows/packer/scripts/windowsUpdate.ps1"]
    pause_before = "2m"
    elevated_user = "Administrator"
    elevated_password =var.win_password 
  }

  provisioner "windows-restart" {
    only = ["nutanix.windows"]
    restart_timeout = "30m"
  }

}