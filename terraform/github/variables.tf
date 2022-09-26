variable "repo_name" {
  description = "Repository name"
  type        = string
  default     = "test-iu-devops-repo"
}

variable "repo_description" {
  description = "Repository description"
  type        = string
  default     = "My awesome test repo made via Terraform!"
}

variable "default_branch_name" {
  description = "Name of the default branch"
  type        = string
  default     = "main"
}
