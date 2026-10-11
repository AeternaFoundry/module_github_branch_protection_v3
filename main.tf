resource "github_branch_protection_v3" "branch_protection_v3s" {
  for_each = var.branch_protection_v3s

  branch                          = each.value.branch
  repository                      = each.value.repository
  enforce_admins                  = each.value.enforce_admins
  require_conversation_resolution = each.value.require_conversation_resolution
  require_signed_commits          = each.value.require_signed_commits

  dynamic "required_pull_request_reviews" {
    for_each = each.value.required_pull_request_reviews != null ? [each.value.required_pull_request_reviews] : []
    content {
      dynamic "bypass_pull_request_allowances" {
        for_each = required_pull_request_reviews.value.bypass_pull_request_allowances != null ? [required_pull_request_reviews.value.bypass_pull_request_allowances] : []
        content {
          apps  = bypass_pull_request_allowances.value.apps
          teams = bypass_pull_request_allowances.value.teams
          users = bypass_pull_request_allowances.value.users
        }
      }
      dismiss_stale_reviews           = required_pull_request_reviews.value.dismiss_stale_reviews
      dismissal_apps                  = required_pull_request_reviews.value.dismissal_apps
      dismissal_teams                 = required_pull_request_reviews.value.dismissal_teams
      dismissal_users                 = required_pull_request_reviews.value.dismissal_users
      include_admins                  = required_pull_request_reviews.value.include_admins
      require_code_owner_reviews      = required_pull_request_reviews.value.require_code_owner_reviews
      require_last_push_approval      = required_pull_request_reviews.value.require_last_push_approval
      required_approving_review_count = required_pull_request_reviews.value.required_approving_review_count
    }
  }

  dynamic "required_status_checks" {
    for_each = each.value.required_status_checks != null ? [each.value.required_status_checks] : []
    content {
      checks         = required_status_checks.value.checks
      contexts       = required_status_checks.value.contexts
      include_admins = required_status_checks.value.include_admins
      strict         = required_status_checks.value.strict
    }
  }

  dynamic "restrictions" {
    for_each = each.value.restrictions != null ? [each.value.restrictions] : []
    content {
      apps  = restrictions.value.apps
      teams = restrictions.value.teams
      users = restrictions.value.users
    }
  }
}

