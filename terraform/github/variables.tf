variable "repository_name" {
  description = "Name of repository to manage"
  type        = string
  default     = "devops-labs"
}

variable "repository_owner" {
  description = "Target GitHub organization or individual user account to manage"
  type        = string
  default     = "igooor-bb"
}

variable "repository_description" {
  description = "Description of repository to manage"
  type        = string
  default     = "Repository for DevOps labs at Innopolis University"
}