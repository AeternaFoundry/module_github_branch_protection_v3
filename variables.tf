variable "branch_protection_v3s" {
  description = <<EOT
Map of branch_protection_v3s, attributes below
Required:
    - branch
    - repository
Optional:
    - enforce_admins
    - require_conversation_resolution
    - require_signed_commits
    - required_pull_request_reviews (block):
        - bypass_pull_request_allowances (optional, block):
            - apps (optional)
            - teams (optional)
            - users (optional)
        - dismiss_stale_reviews (optional)
        - dismissal_apps (optional)
        - dismissal_teams (optional)
        - dismissal_users (optional)
        - include_admins (optional)
        - require_code_owner_reviews (optional)
        - require_last_push_approval (optional)
        - required_approving_review_count (optional)
    - required_status_checks (block):
        - checks (optional)
        - contexts (optional)
        - include_admins (optional)
        - strict (optional)
    - restrictions (block):
        - apps (optional)
        - teams (optional)
        - users (optional)
EOT

  type = map(object({
    branch                          = string
    repository                      = string
    enforce_admins                  = optional(bool)
    require_conversation_resolution = optional(bool)
    require_signed_commits          = optional(bool)
    required_pull_request_reviews = optional(object({
      bypass_pull_request_allowances = optional(object({
        apps  = optional(set(string))
        teams = optional(set(string))
        users = optional(set(string))
      }))
      dismiss_stale_reviews           = optional(bool)
      dismissal_apps                  = optional(set(string))
      dismissal_teams                 = optional(set(string))
      dismissal_users                 = optional(set(string))
      include_admins                  = optional(bool)
      require_code_owner_reviews      = optional(bool)
      require_last_push_approval      = optional(bool)
      required_approving_review_count = optional(number)
    }))
    required_status_checks = optional(object({
      checks         = optional(set(string))
      contexts       = optional(set(string))
      include_admins = optional(bool)
      strict         = optional(bool)
    }))
    restrictions = optional(object({
      apps  = optional(set(string))
      teams = optional(set(string))
      users = optional(set(string))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.branch_protection_v3s : (
        v.required_pull_request_reviews == null || (v.required_pull_request_reviews.required_approving_review_count == null || (v.required_pull_request_reviews.required_approving_review_count >= 0 && v.required_pull_request_reviews.required_approving_review_count <= 6))
      )
    ])
    error_message = "must be between 0 and 6"
  }
}

