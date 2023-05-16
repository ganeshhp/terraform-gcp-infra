variable "machine-type" {
  type        = string
  description = "machine type on gcp"
  default     = "e2-medium"
}
variable "zone-name" {
  type        = string
  description = "name of zone inside region"
  default     = "asia-south1-a"
}

variable "image-name" {
  type        = string
  description = "ubuntu 20.04 image name id"
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"

}

variable "ssh_public_key" {
  type        = string
  description = "The public key to use for SSH access"
  default = "~/.ssh/id_rsa.pub"
}