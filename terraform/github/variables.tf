variable "repo_description" {
  type        = string
  default     = "This repo was created via Terraform"
  description = "GitHub repo description"
}

variable "repo_name" {
  type        = string
  default     = "terraform-repo"
  description = "GitHub repo name"
}

variable "token" {
  type        = string
  description = "GITHUB_TOKEN"
  sensitive   = true
}