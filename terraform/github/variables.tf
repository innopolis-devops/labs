variable "git_token" {
  type        = string
  description = "Specifies the GitHub PAT token or `GITHUB_TOKEN`"
  sensitive   = true
}

variable "repo_name" {
  description = "Specify repository name"
  type        = string
  default     = "devops Terraform lab"
}

variable "repo_description" {
  description = "specify repository description"
  type        = string
  default     = "terraform generated repository"
}

variable "default_branch" {
  description = "specify repo's default branch"
  type        = string
  default     = "master"
}