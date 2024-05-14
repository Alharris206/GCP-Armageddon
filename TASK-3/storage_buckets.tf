#Active Storage Buckets
#>>>

resource "google_storage_bucket" "ninja_bucket" {
  name     = var.ninja_bucket
  location = var.ninja_bucket_region
  force_destroy = true
}

# Set the bucket-level IAM policy to allow public read
resource "google_storage_bucket_iam_binding" "public_read" {
  bucket = google_storage_bucket.ninja_bucket.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers",
  ]
}

# Upload local files to the folder inside the bucket
resource "google_storage_bucket_object" "o1" {
  name   = "PIPE WRENCH.jpg"
  bucket = google_storage_bucket.ninja_bucket.name
  source = var.content_source1
  depends_on = [ google_storage_bucket.ninja_bucket ]
  content_type = "image/jpg"
}

resource "google_storage_bucket_object" "o2" {
  name   = "image(1).png"
  bucket = google_storage_bucket.ninja_bucket.name
  source = var.content_source2
  depends_on = [ google_storage_bucket.ninja_bucket ]
  content_type = "image/png"
}