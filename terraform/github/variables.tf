variable "repository_owner" {
  description = "Target GitHub organization or individual user account to manage"
  type        = string
  default     = "Dablup"
}

variable "repository_name" {
  description = "Name of repository to manage"
  type        = string
  default     = "Test-terraform-repo"
}

variable "token" {
  type        = string
  description = "Specifies the GitHub PAT token or `GITHUB_TOKEN`"
  sensitive   = true
}