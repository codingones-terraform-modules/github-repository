variable "github_organization" {
  description = "The github organization name"
  nullable    = false
  default     = false
}

variable "github_repository" {
  description = "The repository which host the code within the organization"
  nullable    = false
  default     = false
}

variable "github_repository_topics" {
  type        = list(string)
  description = "The topics present on the repository"
  nullable    = true
  default     = []
}

variable "allow_force_pushes_to_default_branch" {
  type        = bool
  description = "Allows to push directly on default branch, if false a PR is mandatory"
  nullable    = true
  default     = false
}

variable "required_context_checks" {
  type        = list(string)
  description = "Required CI checks to pass,following the format workflowName/jobName eg: Validate/Prettier"
  nullable    = true
  default     = []
}

variable "github_repository_description" {
  type        = string
  description = "Repository description"
  nullable    = true
  default     = "An awesome repository"
}

