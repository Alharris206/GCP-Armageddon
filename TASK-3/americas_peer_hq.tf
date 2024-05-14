#3 ---> 1
resource "google_compute_network_peering" "network1_to_network3" {
  name         = "network1-to-network3"
  network      = google_compute_network.network_1.self_link
  peer_network = google_compute_network.network_3.self_link
  depends_on = [ google_compute_network.network_1, google_compute_network.network_3 ]
}

resource "google_compute_network_peering" "network3_to_network1" {
  name         = "network3-to-network1"
  network      = google_compute_network.network_3.self_link
  peer_network = google_compute_network.network_1.self_link
  depends_on = [ google_compute_network.network_1, google_compute_network.network_3 ]
}
#>>>

#4 ---> 1
resource "google_compute_network_peering" "network1_to_network4" {
  name         = "network1-to-network4"
  network      = google_compute_network.network_1.self_link
  peer_network = google_compute_network.network_4.self_link
  depends_on   = [google_compute_network.network_1, google_compute_network.network_4]
}

resource "google_compute_network_peering" "network4_to_network1" {
  name         = "network4-to-network1"
  network      = google_compute_network.network_4.self_link
  peer_network = google_compute_network.network_1.self_link
  depends_on   = [google_compute_network.network_1, google_compute_network.network_4]
}


#Peering Internal Rule
#3-1
resource "google_compute_firewall" "allow_peering_traffic" {
  name    = "allow-peering-traffic"
  network = google_compute_network.network_1.self_link

  allow {
    protocol = "all"
  }

  source_ranges = ["10.169.1.0/24"]  # Replace with the IP range of Network 3
  depends_on = [ google_compute_network_peering.network1_to_network3, google_compute_network_peering.network3_to_network1]
}
#>>>

#4-1
resource "google_compute_firewall" "allow_peering_traffic2" {
  name    = "allow-peering-traffic2"
  network = google_compute_network.network_1.self_link

  allow {
    protocol = "all"
  }

  source_ranges = ["10.169.1.0/24"]  # Replace with the IP range of Network 3
  depends_on = [ google_compute_network_peering.network1_to_network4, google_compute_network_peering.network4_to_network1]
}
