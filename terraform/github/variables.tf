variable "repository_name" {
  description = "Name of repository to manage"
  type        = string
  default     = "inno-devops-labs"
}

variable "repository_owner" {
  description = "Target GitHub organization or individual user account to manage"
  type        = string
  default     = "glebosotov"
}

variable "repository_description" {
  description = "Description of repository to manage"
  type        = string
  default     = "DevOps repository"
}