output "git_branches" {
  description = "My github branches"
  value       = github_repository.main.branches
}

output "repository_url" {
  description = "URL for lab's repository "
  value       = github_repository.main.svn_url
}