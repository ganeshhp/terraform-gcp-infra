# Define provider
provider "google" {
  credentials = file("project05122023-559b9d11eb87.json")
  project     = var.project-id
  region      = var.region-name
}

module "network" {
  source = "./network"
}

module "vm-instances" {
  source     = "./vm-instance"
  depends_on = [module.network]
}