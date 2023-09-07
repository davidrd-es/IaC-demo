locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "nutanix" "rocky" {
  nutanix_username = var.nutanix_username
  nutanix_password = var.nutanix_password
  nutanix_endpoint = var.nutanix_endpoint
  nutanix_port     = var.nutanix_port
  nutanix_insecure = var.nutanix_insecure
  cluster_name     = var.nutanix_cluster
  os_type          = "Linux"
  

  vm_disks {
      image_type = "ISO_IMAGE"
      source_image_name = var.nutanix_source_iso
  }

  vm_disks {
      image_type = "DISK"
      disk_size_gb = 52
  }

  vm_nics {
    subnet_name       = var.nutanix_subnet
  }
  
  cd_files = ["${path.cwd}/rocky/packer/scripts/"]
  cd_content = {
    "ks.cfg" = templatefile("./scripts/ks.cfg.pkrtpl.hcl", {

    lnx_vg_system_name    = var.lnx_vg_system_name
    lnx_vg_system_size    = var.lnx_vg_system_size
    lnx_vol_size_root     = var.lnx_vol_size_root
    lnx_vol_size_tmp      = var.lnx_vol_size_tmp
    lnx_vol_size_varlog   = var.lnx_vol_size_varlog
    lnx_vol_size_home     = var.lnx_vol_size_home
    lnx_vol_size_opt      = var.lnx_vol_size_opt
    lnx_vol_size_usr      = var.lnx_vol_size_usr
    lnx_vol_size_var      = var.lnx_vol_size_var
    lnx_root_password     = var.lnx_root_password
    lnx_system_lang       = var.lnx_system_lang
    lnx_keyboard_lang     = var.lnx_keyboard_lang
    lnx_timezone          = var.lnx_timezone
    })
  }
  cd_label          = "OEMDRV"
  image_name        = "rocky-9.1-${local.timestamp}"
  ssh_username      = "root"
  ssh_password      = var.lnx_root_password
  shutdown_command  = "echo 'packer' | sudo -S shutdown -P now"
  shutdown_timeout  = "2m"
}
