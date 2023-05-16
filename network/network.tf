
# Define network and subnetwork
resource "google_compute_network" "vpc-network" {
  name                    = var.vpc-network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnet1" {
  name          = var.subnet
  network       = google_compute_network.vpc-network.self_link
  ip_cidr_range = var.cidr-subnet
}

# Define firewall rule to allow incoming traffic
resource "google_compute_firewall" "allow_ports" {
  name    = "allow-ports"
  network = google_compute_network.vpc-network.self_link

  allow {
    protocol = var.allow-protocol
    ports    = ["80"]
  }

  allow {
    protocol = var.allow-protocol
    ports = ["22"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = ["0.0.0.0/0"]

}

