
# Output the bucket URL
output "bucket_url" {
  value = google_storage_bucket.bucket.url
}