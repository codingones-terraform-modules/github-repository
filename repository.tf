data "github_organization" "organization" {
  name = var.github_organization
}

resource "github_repository" "repository" {
  name                   = var.github_repository
  description            = var.github_repository_description
  visibility             = "public"
  auto_init              = true
  delete_branch_on_merge = true
  topics                 = var.github_repository_topics
}

resource "github_branch_default" "main" {
  repository = github_repository.repository.name
  branch     = "main"

  depends_on = [github_repository.repository]
}

resource "github_branch_protection" "main_branch_protection" {
  repository_id                   = github_repository.repository.node_id
  pattern                         = github_branch_default.main.branch
  require_signed_commits          = true
  required_linear_history         = true
  require_conversation_resolution = true
  allows_force_pushes             = var.allow_force_pushes_to_default_branch
  allows_deletions                = false

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}

resource "github_branch_protection" "other_branches_protection" {
  repository_id                   = github_repository.repository.node_id
  pattern                         = "(build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test)/.*"
  require_signed_commits          = true
  required_linear_history         = true
  require_conversation_resolution = true
  allows_force_pushes             = true
  allows_deletions                = true

  required_status_checks {
    strict   = true
    contexts = var.required_context_checks
  }
}