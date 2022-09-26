variable "repository_name" {
  description = "Name of repository to manage"
  type        = string
  default     = "labs"
}

variable "repository_owner" {
  description = "Target GitHub organization or individual user account to manage"
  type        = string
  default     = "yadariya"
}

variable "repository_description" {
  description = "Description of repository to manage"
  type        = string
  default     = "DevOps repository"
}