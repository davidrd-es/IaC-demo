## Nutanix Variables

variable "nutanix_username" {
  type = string
}

variable "nutanix_password" {
  type =  string
  sensitive = true
}

variable "nutanix_endpoint" {
  type = string
}

variable "nutanix_port" {
  type = number
}

variable "nutanix_insecure" {
  type = bool
  default = true
}

variable "nutanix_subnet" {
  type = string
}

variable "nutanix_cluster" {
  type = string
}

variable "nutanix_source_iso" {
  type = string
}

## OS Variables

variable "lnx_vg_system_name" {
  type = string
}

variable "lnx_vg_system_size" {
  type = string
}

variable "lnx_vol_size_root" {
  type = string
}

variable "lnx_vol_size_tmp" {
  type = string
}

variable "lnx_vol_size_varlog" {
  type = string
}

variable "lnx_vol_size_home" {
  type = string
}

variable "lnx_vol_size_opt" {
  type = string
}

variable "lnx_vol_size_usr" {
  type = string
}

variable "lnx_vol_size_var" {
  type = string
}

variable "lnx_root_password" {
  type = string
}

variable "lnx_system_lang" {
  type = string
}

variable "lnx_keyboard_lang" {
  type = string
}

variable "lnx_timezone" {
  type = string
}