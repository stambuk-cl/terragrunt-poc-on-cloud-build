remote_state {
 backend = "gcs"

 generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

 config = {
   bucket = "cloud-terraform-infra"
   prefix = "terraform/${path_relative_to_include()}"
 }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    required_version = ">= 1.1.7"
  required_providers {  
    google = {
      version = "4.16.0"
        }
      }
    }
   provider "google" { 
     project = "sandbox-gcp"
    }
  EOF
}
