resource "google_storage_bucket" "site" {
  name          = "kevinsite7"
  location      = "US"
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_iam_binding" "public" {
  bucket = google_storage_bucket.site.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers",
  ]
}

resource "google_storage_bucket_object" "index" {
  name         = "index.html"
  bucket       = google_storage_bucket.site.name
  source       = "${path.module}/assets/index.html"
  content_type = "text/html"
}

resource "google_storage_bucket_object" "not_found" {
  name         = "404.html"
  bucket       = google_storage_bucket.site.name
  source       = "${path.module}/assets/404.html"
  content_type = "text/html"
}

resource "google_storage_bucket_object" "image" {
  name         = "906bb27a-747b-4faa-8f85-4c249699f915.jpg"
  bucket       = google_storage_bucket.site.name
  source       = "${path.module}/assets/906bb27a-747b-4faa-8f85-4c249699f915.jpg"
  content_type = "image/jpeg"
}

resource "google_storage_bucket_object" "css" {
  name         = "style.css"
  bucket       = google_storage_bucket.site.name
  source       = "${path.module}/assets/style.css"
  content_type = "text/css"
}

###################LOCAL FILE OF FAVORITE FOOD#####################
resource "local_file" "favorite_food" {
  filename = "favorite_food.txt"
  content  = "My favorite food is SEAFOOD."
}

#######gcp vpc###########################
resource "google_compute_network" "vpc_network" {
  name                    = "week7-vpc"
  auto_create_subnetworks = true
}
