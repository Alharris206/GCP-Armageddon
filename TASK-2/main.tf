resource "google_compute_network" "custom-vpc-tf" {
  project                 = "gcp-tutorial-project-1-417922"
  name                    = "custom-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-la" {
  name                     = "sub-la"
  ip_cidr_range            = "10.44.0.0/24"
  region                   = "us-west2"
  private_ip_google_access = true
  network                  = google_compute_network.custom-vpc-tf.id
}

resource "google_compute_instance" "custom-instance" {
  depends_on   = [google_compute_subnetwork.sub-la]
  name         = "test-instance"
  machine_type = "e2-medium"
  zone         = "us-west2-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata = {
    startup-script = file("${path.module}/startup-script.sh")
  }

  network_interface {
    network    = google_compute_network.custom-vpc-tf.id
    subnetwork = google_compute_subnetwork.sub-la.id
    access_config {
      // Ephemeral IP
    }
  }
  service_account {
    email  = "gcp-tutorial-udemy-terraform@gcp-tutorial-project-1-417922.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_firewall" "allow-icmp" {
  name    = "allow-icmp"
  network = google_compute_network.custom-vpc-tf.id
  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]


  allow {
    protocol = "tcp"
    ports    = ["80", "22", "443"]
  }
}



output "vpc" {
  value = google_compute_network.custom-vpc-tf.name
}

output "external_ip" {
  value = google_compute_instance.custom-instance.network_interface.0.access_config.0.nat_ip
}

output "internal_ip" {
  value = google_compute_instance.custom-instance.network_interface.0.network_ip
}

output "subnet" {
  value = google_compute_subnetwork.sub-la.name
}