# Define VM instances

resource "google_compute_instance" "vm_instance_1" {
  for_each     = toset(["node-c1", "node-wn1", "node-wn2"])
  name         = each.value
  machine_type = var.machine-type
  zone         = var.zone-name
  boot_disk {
    initialize_params {
      image = var.image-name
    }
  }

  network_interface {
  #  network    = data.google_compute_network.custom-vpc.self_link
  #  subnetwork = data.google_compute_subnetwork.custom-subnet.self_link
   subnetwork = "default"
    access_config {
      # ephemeral external IP expected
    }
  }

  metadata = {
    ssh-keys = "user:${var.ssh_public_key}"
  }

  metadata_startup_script = "sudo apt update -y && sudo apt install containerd -y && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && sudo touch /etc/apt/sources.list.d/kubernetes.list && echo 'deb https://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list && sudo apt update -y && sudo apt install kubelet kubeadm kubectl -y && sudo systemctl enable containerd"
  
  }


#resource "google_compute_instance" "vm_instance_2" {
#  name         = "vm-instance-2"
##  machine_type = "e2-medium"
#  zone         = "us-central1-b"
#  boot_disk {
#    initialize_params {
#      image = "debian-cloud/debian-10"
#    }
#  }

#  network_interface {
#    network = google_compute_network.my_network.self_link
#    subnetwork = google_compute_subnetwork.my_subnet.self_link
#  }

#  metadata = {
#    ssh-keys = "user:${file("~/.ssh/id_rsa.pub")}"
#  }
#}
