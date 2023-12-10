# Create a Bastion host for external access to the DB resource
resource "google_compute_instance" "bastion" {
  name         = "bastion"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    subnetwork = "your-subnetwork-id"  # Replace with the actual ID of the subnetwork you want to use

    access_config {
      # Use ephemeral IP for simplicity, consider using a static IP for production
    }
  }

  metadata = {
    ssh-keys = "your-ssh-key"  # Replace with your SSH public key
  }

  # Add any additional configurations for the Bastion host as needed
}
