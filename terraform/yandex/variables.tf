variable "box_net" {
  description = "Network name"
  default     = "box-net"
}

variable "box_subnet" {
  description = "Subnetwork name"
  default     = "box-subnet"
}

variable "box_name" {
  description = "VM name"
  default     = "timeweb"
}

variable "hostname" {
  description = "VM hostname"
  default     = "box"
}

variable "box_ip" {
  description = "VM IP address"
  default     = "10.10.10.10"
}

variable "vm_system_config" {
  description = "VM system config"
  default = {
    core_fraction = 20,
    cores         = 2,
    memory        = 2,
    ssd_size      = 25
    image_id      = "fd8touptelufms7frnlm"
  }
}

variable "vm_user" {
  description = "VM username"
  default     = "user"
}
