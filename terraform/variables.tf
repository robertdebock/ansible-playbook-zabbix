variable "size" {
  description = "The size of your deployment, either \"small\", \"medium\" or \"large\"."
  type        = string
  default     = "small"
  validation {
    condition     = var.size == "small" || var.size == "medium" || var.size == "large"
    error_message = "The \"size\" must be either \"small\", \"medium\" or \"large\"."
  }
}

variable "region" {
  description = "The region where to place this deployment."
  type        = string
  default     = "ams3"
  validation {
    condition     = contains(["ams2", "ams3", "blr1", "fra1", "lon1", "nyc1", "nyc2", "nyc3", "sfo1", "sfo2", "sfo3", "sgp1"], var.region)
    error_message = "Valid regions are: \"ams2\", \"ams3\", \"blr1\", \"fra1\", \"lon1\", \"nyc1\", \"nyc2\", \"nyc3\", \"sfo1\", \"sfo2\", \"sfo3\" or \"sgp1\"."
  }
}
