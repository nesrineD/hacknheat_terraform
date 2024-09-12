# TODO: Create a Compute Disk
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk
resource "google_service_account" "compute" {
  account_id = "terraform-compute-sa"
  display_name    = "SA for VM Instance Hack and Heat"
}
resource "google_compute_disk" "compute" {
  name  = "test-disk"
  type  = "pd-ssd"
  zone  = "europe-west4-a"
  image = "debian-11-bullseye-v20220719"
}
# TODO: Create a VM with the disk attached
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
