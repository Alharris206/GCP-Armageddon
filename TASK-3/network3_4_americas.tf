#Network 3 - Americas 
resource google_compute_network "network_3" {
    name                    = "america1-net"
    description             = "3"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
    mtu                     = 1460
}

output "n3" {
    value = google_compute_network.network_3.name
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Subnet1 - LosAngeles
resource google_compute_subnetwork "network3_sub1" {
    name          = "losangeles-office"
    description   = "losangeles office subnet"
    ip_cidr_range = "10.169.1.0/24"
    region        = "us-west2"
    network       = google_compute_network.network_3.id
}
#>>>
output "n3_s1" {
    value = google_compute_subnetwork.network3_sub1.name
}
output "n3_s1_range" {
    value = google_compute_subnetwork.network3_sub1.ip_cidr_range
}
output "n3_s1_region" {
    value = google_compute_subnetwork.network3_sub1.region
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Network 4 - Americas
resource google_compute_network "network_4" {
    name                    = "america2-net"
    description             = "4"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
    mtu                     = 1460
}

output "n4" {
    value = google_compute_network.network_4.name
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Subnet2 - SOUTH CAROLINA
resource google_compute_subnetwork "network4_sub1" {
    name          = "south-carolina-office"
    description   = "South Carolina subnet"
    ip_cidr_range = "10.167.1.0/24"
    region        = "us-east1"
    network       = google_compute_network.network_4.id
}
#>>>
output "n4_s1" {
    value = google_compute_subnetwork.network4_sub1.name
}
output "n4_s1_range" {
    value = google_compute_subnetwork.network4_sub1.ip_cidr_range
}
output "n4_s1_region" {
    value = google_compute_subnetwork.network4_sub1.region
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Firewall rules:
#Net 3

#RDP
resource "google_compute_firewall" "net3_rdp"{
    name = "net3-rdp"
    network = google_compute_network.network_3.id
    description = "firewall rules for network"
    direction = "INGRESS"
    priority = 65534
    source_ranges = ["0.0.0.0/0"]
    allow {
        protocol = "tcp"
        ports = ["3389"]
    }
}
#>>>

#Net 4
#RDP
resource "google_compute_firewall" "net4_rdp"{
    name = "net4-rdp"
    network = google_compute_network.network_4.id
    description = "firewall rules for network"
    direction = "INGRESS"
    priority = 65534
    source_ranges = ["0.0.0.0/0"]
    allow {
        protocol = "tcp"
        ports = ["3389"]
    }
}

resource "google_compute_firewall" "net1_http" {
  name        = "net1-http"
  network     = google_compute_network.network_1.id
  description = "net-http"
 
  #Osaka office
  source_ranges = ["10.206.44.0/24", "192.168.44.0/24", "10.167.1.0/24", "10.169.1.0/24"] 
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}