locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "nutanix" "windows" {
  nutanix_username = var.nutanix_username
  nutanix_password = var.nutanix_password
  nutanix_endpoint = var.nutanix_endpoint
  nutanix_port     = var.nutanix_port
  nutanix_insecure = var.nutanix_insecure
  cluster_name     = var.nutanix_cluster
  os_type          = "Windows"
  

  vm_disks {
      image_type = "ISO_IMAGE"
      source_image_name = var.nutanix_source_iso
  }

  vm_disks {
      image_type = "ISO_IMAGE"
      source_image_name = var.nutanix_virtio_iso
  }

  vm_disks {
      image_type = "DISK"
      disk_size_gb = 80
  }

  vm_nics {
    subnet_name       = var.nutanix_subnet
  }
  

  cd_files = ["${path.cwd}/windows/packer/scripts/"]
  cd_content = {
    "autounattend.xml" = templatefile("./scripts/autounattend.xml.pkrtpl.hcl", {

    win_os_locale       = var.win_os_locale
    win_kb_locale       = var.win_kb_locale 
    win_product_key     = var.win_product_key
    win_organization    = var.win_organization
    win_name            = var.win_name
    win_timezone        = var.win_timezone
    win_computer_name   = var.win_computer_name
    win_password        = var.win_password
    })
  }


  image_name        = "windows-${local.timestamp}"
  communicator      = "winrm"
  winrm_port        = 5985
  winrm_insecure    = true
  winrm_use_ssl     = false
  winrm_timeout     = "45m"
  winrm_password    = var.win_password
  winrm_username    = "Administrator"
  shutdown_command  = "powershell -c \"C:\\windows\\system32\\sysprep\\sysprep.exe /generalize /oobe /mode:vm\""
  shutdown_timeout  = "20m"
}
