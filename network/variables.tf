variable "vpc-network" {
  type        = string
  description = "VPC name on GCP"
  default     = "vpc-network"
}

variable "subnet" {
  type        = string
  description = "subnet name inside vpc"
  default     = "my-subnet1"
}

variable "cidr-subnet" {
  type        = string
  description = "CIDR block inside subnet"
  default     = "10.0.0.0/24"

}

variable "allow-protocol" {
  type        = string
  description = "network protocol to allow in firewall"
  default     = "tcp"
}