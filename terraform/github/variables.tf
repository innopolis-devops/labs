variable "repository_name" {
  description = "Name of repository to manage"
  type        = string
  default     = "devops"
}

variable "repository_owner" {
  description = "Target GitHub organization or individual user account to manage"
  type        = string
  default     = "bragov4ik"
}