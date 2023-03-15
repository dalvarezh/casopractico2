variable "location" {
  type        = string
  description = "Región of Azure where the infrastructure is created"
  default     = "uksouth"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-dalvarezh"
}

variable "registry_name" {
  type        = string
  description = "Name of the registry"
  default     = "registrydalvarezh"
}

variable "network_name" {
  type        = string
  description = "Name of the virtual network"
  default     = "vnet1"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
  default     = "subnet1"
}

variable "nic_name" {
  type        = string
  description = "Name of the network interface"
  default     = "nic1"
}

variable "public_key_path" {
  type        = string
  description = "Ruta para la clave pública de acceso a las instancias"
  default     = "~/.ssh/id_rsa.pub" # o la ruta correspondiente
}

variable "ssh_user" {
  type        = string
  description = "Usuario para hacer ssh"
  default     = "dalvarezh"
}

variable "vm_spec" {
  type = object({
    name           = string
    size           = string
    admin_username = string
  })

  sensitive = true

  default = {
    name           = "vm1"
    size           = "Standard_F2"
    admin_username = "dalvarezh"
  }
}

variable "osimage_spec" {
  type = object({
    name      = string
    product   = string
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })

  default = {
    name      = "centos-8-stream-free"
    product   = "centos-8-stream-free"
    publisher = "cognosys"
    offer     = "centos-8-stream-free"
    sku       = "centos-8-stream-free"
    version   = "22.03.28"
  }
}

variable "k8s_name" {
  type        = string
  description = "Name of the kubernetes cluster"
  default     = "k8s"
}

variable "dns" {
  type        = string
  description = "DNS of the Kubernetes cluster"
  default     = "k8sdalvarezh"
}
