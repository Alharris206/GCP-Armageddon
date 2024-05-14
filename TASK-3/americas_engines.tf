#Los Angeles:
#VM Instance 3
resource "google_compute_instance" "vm_instance_3" {
  name         = "engine-3"
  machine_type = var.vm2_machine_type
  zone         = "us-west2-a"

  boot_disk {
    initialize_params {
      image = var.vm2_image
      size = 50
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = "projects/gcp-tutorial-project-1-417922/regions/us-west2/subnetworks/losangeles-office"
    stack_type  = "IPV4_ONLY"
  }

  service_account {
    email  = "gcp-tutorial-udemy-terraform@gcp-tutorial-project-1-417922.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_compute_subnetwork.network3_sub1 ]
}
#>>>

#=South Carolina:
#VM Instance 4
resource "google_compute_instance" "vm_instance_4" {
  name         = "engine-4"
  machine_type = var.vm2_machine_type
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = var.vm2_image
      size = 50 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = "projects/gcp-tutorial-project-1-417922/regions/us-east1/subnetworks/south-carolina-office"
    stack_type  = "IPV4_ONLY"
  }

  service_account {
    email  = "gcp-tutorial-udemy-terraform@gcp-tutorial-project-1-417922.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_compute_subnetwork.network4_sub1 ]
}