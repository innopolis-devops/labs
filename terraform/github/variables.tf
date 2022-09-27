variable "repository_name" {
  description = "github repository name"
  type        = string
  default     = "devops-generated-repo"
}

variable "repository_desc" {
  description = "github repository description"
  type        = string
  default     = "generated using terraform"
}