# HINT: use `terraform plan` & `terraform apply` to create the resources

# TODO: Create a google_storage_bucket 
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource "google_storage_bucket" "hack_and_heat_terraform" {

  name          = "hack_and_heat_terraform_bucket"
  location      = "EU"
}


# TODO: Create an IAM binding with the role Storage Object User and yourself as the member
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.hack_and_heat_terraform.name
  role = "roles/storage.objectUser"
  members = [
    "user:nesrine.doghri1@gmail.com",
  ]
}

# TODO: Create a data source for a GCS Bucket and use following bucket: hack-and-heat-2024-task-5
# A data source allows Terraform to use information defined outside of Terraform, in this case our already exisiting bucket in the GCP project.
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/storage_bucket
data "google_storage_bucket" "one-bucket" {
  name = google_storage_bucket.hack_and_heat_terraform.name
}
# TODO: Upload Readme.md to the bucket you fetched above with your data source. Use your name as a prefix for the storage bucket object resource.
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object

resource "google_storage_bucket_object" "readMe" {
  name   = "README.md" # folder name should end with '/'
  source =  "README.md"           # content is ignored but should be non-empty
  bucket = google_storage_bucket.hack_and_heat_terraform.name
}