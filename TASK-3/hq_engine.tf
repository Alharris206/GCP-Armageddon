#VM Instance 1
resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = var.vm_zone


  boot_disk {
    initialize_params {
      image = var.vm_image
      size = 50 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = var.vm_subnetwork
    stack_type  = "IPV4_ONLY"
  }

  metadata_startup_script = var.vm_metadata

  service_account {
    email  = "gcp-tutorial-udemy-terraform@gcp-tutorial-project-1-417922.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_storage_bucket.ninja_bucket, google_compute_subnetwork.network_sub1 ]
}




