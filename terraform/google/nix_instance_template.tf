resource "google_compute_instance_template" "caravan_ubuntu" {
  name = "caravan-ubuntu"
  project = var.project
  region = var.region
  instance_description = "Where I code when I'm on the road"


  description = "Instance template for deploying nix and home-manager for a portable setup"
  
  labels = {
    environment = "dev"
  }

  // Create a new boot disk from an image
  disk {
    source_image      = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20220204"
    auto_delete       = true
    boot              = true
    disk_size_gb      = 50
  }

  network_interface {
    network = "default"
    subnetwork = "default"
    subnetwork_project = var.project

    access_config {
    network_tier = "PREMIUM"
    }
  }

  tags = ["http-server", "https-server"]

  machine_type = var.machine_type
  metadata_startup_script = <<SCRIPT
  #! /bin/bash

  cd /home/tom
  git clone https://github.com/chaosinthecrd/caravan.git
  sudo -u tom bash -c '/home/tom/caravan/init.sh';
  rm -r /home/tom/caravan
  SCRIPT
}
