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

variable "nutanix_virtio_iso" {
  type = string
}

variable "win_os_locale" {
  type = string
}
variable "win_kb_locale" {
  type = string
}
variable "win_product_key" {
  type = string
}
variable "win_organization" {
  type = string
}
variable "win_name" {
  type = string
}
variable "win_timezone" {
  type = string
}
variable "win_computer_name" {
  type = string
}
variable "win_password" {
  type = string
}