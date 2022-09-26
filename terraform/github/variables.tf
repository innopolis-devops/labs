variable "token" {
  type        = string
  description = "Specifies the GitHub PAT token or `GITHUB_TOKEN`"
  sensitive   = true
}

variable "repo_name" {
  description = "Name of the Github repository"
  type        = string
  default     = "new-terraform-repository"
}

variable "repo_description" {
  description = "Description of the Github repository"
  type        = string
  default     = "The magic that terraform does"
}
