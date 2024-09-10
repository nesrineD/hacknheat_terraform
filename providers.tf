provider "google" {
    project = var.project_id
    credentials = file("other/sa_key.json")
}
