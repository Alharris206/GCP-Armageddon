#VM Instance 2
resource "google_compute_instance" "vm_instance_2" {
  name         = var.vm2_name
  machine_type = var.vm2_machine_type
  zone         = var.vm2_zone

  boot_disk {
    initialize_params {
      image = var.vm2_image
      size = 100 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = var.vm2_subnetwork
    stack_type  = "IPV4_ONLY"
  }

  service_account {
    email  = "gcp-tutorial-udemy-terraform@gcp-tutorial-project-1-417922.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_compute_subnetwork.network2_sub1 ]
}