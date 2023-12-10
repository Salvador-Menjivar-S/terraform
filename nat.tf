# Define a subnetwork
resource "google_compute_subnetwork" "private" {
  name          = "private-subnet"
  ip_cidr_range = "10.0.1.0/24"  # Replace with your desired private subnet range
  region        = "us-central1"
  network       = google_compute_network.main.name
}

# Define a router
resource "google_compute_router" "router" {
  name    = "main-router"
  region  = "us-central1"
  network = google_compute_network.main.name

  # Specify your BGP or other routing configurations if needed
}

# Define a NAT configuration
resource "google_compute_router_nat" "nat" {
  name   = "nat"
  router = google_compute_router.router.name
  region = "us-central1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"  # Replace with your subnetworks
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.private.name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.nat.self_link]
}

# Define an external IP address for NAT
resource "google_compute_address" "nat" {
  name         = "nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
}

# Ensure that the Compute Engine API is enabled
resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}
