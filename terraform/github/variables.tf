variable "token" {
  type        = string
  description = "GitHub PAT token"
  sensitive   = true
}

variable "repo_name" {
  description = "Name of the GitHub repository"
  type        = string
  default     = "devops-terraform-repo"
}

variable "repo_desc" {
  description = "Description of the Github repository"
  type        = string
  default     = "Generated using Terraform"
}
