output "repository_name" {
  description = "The name of the GitHub repository"
  value       = github_repository.repository.name
}

output "default_branch_name" {
  description = "The default branch name of the GitHub repository"
  value       = github_branch_default.main.branch
}