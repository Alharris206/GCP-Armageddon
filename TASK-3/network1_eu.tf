#Parent Network
resource google_compute_network "network_1" {
    name                    = var.net1
    description             = "Network channel for Net1 variable"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
    mtu                     = 1460
}

output "n1" {
    value = google_compute_network.network_1.name
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Subnet1
resource google_compute_subnetwork "network_sub1" {
    name          = var.net1_sub1
    description   = "CDPR main office subnet"
    ip_cidr_range = var.net1_sub1_iprange
    region        = var.net1_sub1_region
    network       = google_compute_network.network_1.id
}
#>>>
output "n1_s1" {
    value = google_compute_subnetwork.network_sub1.name
}
output "n1_s1_range" {
    value = google_compute_subnetwork.network_sub1.ip_cidr_range
}
output "n1_s1_region" {
    value = google_compute_subnetwork.network_sub1.region
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Firewall rules:
#ICMP
resource "google_compute_firewall" "net1_icmp"{
    name = "net1-icmp"
    network = google_compute_network.network_1.id
    description = "firewall rules for network"
    direction = "INGRESS"
    priority = 65534
    source_ranges = ["0.0.0.0/0"]
    allow {
        protocol = "icmp"
    }
}
#>>>

#RDP
resource "google_compute_firewall" "net1_rdp"{
    name = "net1-rdp"
    network = google_compute_network.network_1.id
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

#SSH
resource "google_compute_firewall" "net1_ssh"{
    name = "net1-ssh"
    network = google_compute_network.network_1.id
    description = "plumber"
    direction = "INGRESS"
    priority = 65534
    source_ranges = ["0.0.0.0/0"]
    allow {
        protocol = "tcp"
        ports = ["22"]
    }
}
#>>>



