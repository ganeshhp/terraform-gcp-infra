# network VPC and Subnet details

data "google_compute_network" "custom-vpc" {
  name = "vpc-network"
}

data "google_compute_subnetwork" "custom-subnet" {
  name = "my-subnet1"
}
