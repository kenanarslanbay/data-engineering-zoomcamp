variable "credentials" {
  description = "My Credentials"
  default     = "/home/Kenan/.gc/my-creds.json"
}

variable "project" {
  description = "Project"
  default     = "semiotic-pager-411512"

}

variable "location" {
  description = "Project Location"
  default     = "EU"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "data-engineering-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}