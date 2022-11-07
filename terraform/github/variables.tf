variable "token" {
  type        = string
  description = "Specifies the GitHub PAT token or `GITHUB_TOKEN`"
  sensitive   = true
}

variable "name" {
  description = "The repository name"
  type        = string
  default     = "Terraform_created_repo"
}

variable "description" {
  description = "The repository description"
  type        = string
  default     = "This repo was automatically created by Terraform!"
}

variable "visibility" {
  description = "The repository visibility"
  type        = string
  default     = "public"
}

variable "license" {
  description = "The repository license template"
  type        = string
  default     = "mit"
}

variable "gitignore" {
  description = "The repository gitignore template"
  type        = string
  default     = "VisualStudio"
}
