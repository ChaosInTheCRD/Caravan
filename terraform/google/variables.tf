variable project {
  description = "Google Cloud Project"
  type = string
}

variable region {
  description = "Google Cloud Region"
  type = string
  default = "europe-west2"
}

variable machine_type {
  description = "Google Cloud Compute Machine Type"
  type = string
  default = "e2-standard-2"
}
