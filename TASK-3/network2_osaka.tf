#Parent Network
resource google_compute_network "network_2" {
    name                    = var.net2
    description             = "Network channel for Net1 variable"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
    mtu                     = 1460
}

output "n2" {
    value = google_compute_network.network_2.name
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Subnet1
resource google_compute_subnetwork "network2_sub1" {
    name          = var.net2_sub1
    description   = "CDPR Osaka office subnet"
    ip_cidr_range = var.net2_sub1_iprange
    region        = var.net2_sub1_region
    network       = google_compute_network.network_2.id
}
#>>>
output "n2_s1" {
    value = google_compute_subnetwork.network2_sub1.name
}
output "n2_s1_range" {
    value = google_compute_subnetwork.network2_sub1.ip_cidr_range
}
output "n2_s1_region" {
    value = google_compute_subnetwork.network2_sub1.region
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Firewall rules:

#RDP
resource "google_compute_firewall" "net2_rdp"{
    name = "net2-rdp"
    network = google_compute_network.network_2.id
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
