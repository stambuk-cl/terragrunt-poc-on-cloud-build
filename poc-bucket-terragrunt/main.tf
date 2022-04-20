resource "google_storage_bucket" "bucket1" {
  name          = "bucket-random-terragrunt-poc"
  location      = "US"
  force_destroy = false
  storage_class = "STANDARD"
  versioning {
    enabled = "true"
  }

  uniform_bucket_level_access = true

}
