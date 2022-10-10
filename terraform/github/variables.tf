variable "token" {
  type        = string
  description = "Specifies the GitHub PAT token or `GITHUB_TOKEN`"
  sensitive   = true
}

variable "repo_name" {
  description = "Name of the Github repository"
  type        = string
  default     = "develop-with-terraform"
}

variable "repo_description" {
  description = "Description of the Github repository"
  type        = string
  default     = "This repository created by terraform"
}