output "branch_protection_v3s_id" {
  description = "Map of id values across all branch_protection_v3s, keyed the same as var.branch_protection_v3s"
  value       = { for k, v in github_branch_protection_v3.branch_protection_v3s : k => v.id }
}
output "branch_protection_v3s_branch" {
  description = "Map of branch values across all branch_protection_v3s, keyed the same as var.branch_protection_v3s"
  value       = { for k, v in github_branch_protection_v3.branch_protection_v3s : k => v.branch }
}
output "branch_protection_v3s_enforce_admins" {
  description = "Map of enforce_admins values across all branch_protection_v3s, keyed the same as var.branch_protection_v3s"
  value       = { for k, v in github_branch_protection_v3.branch_protection_v3s : k => v.enforce_admins }
}
output "branch_protection_v3s_etag" {
  description = "Map of etag values across all branch_protection_v3s, keyed the same as var.branch_protection_v3s"
  value       = { for k, v in github_branch_protection_v3.branch_protection_v3s : k => v.etag }
}
output "branch_protection_v3s_repository" {
  description = "Map of repository values across all branch_protection_v3s, keyed the same as var.branch_protection_v3s"
  value       = { for k, v in github_branch_protection_v3.branch_protection_v3s : k => v.repository }
}
output "branch_protection_v3s_require_conversation_resolution" {
  description = "Map of require_conversation_resolution values across all branch_protection_v3s, keyed the same as var.branch_protection_v3s"
  value       = { for k, v in github_branch_protection_v3.branch_protection_v3s : k => v.require_conversation_resolution }
}
output "branch_protection_v3s_require_signed_commits" {
  description = "Map of require_signed_commits values across all branch_protection_v3s, keyed the same as var.branch_protection_v3s"
  value       = { for k, v in github_branch_protection_v3.branch_protection_v3s : k => v.require_signed_commits }
}
output "branch_protection_v3s_required_pull_request_reviews" {
  description = "Map of required_pull_request_reviews values across all branch_protection_v3s, keyed the same as var.branch_protection_v3s"
  value       = { for k, v in github_branch_protection_v3.branch_protection_v3s : k => one(v.required_pull_request_reviews) }
}
output "branch_protection_v3s_required_status_checks" {
  description = "Map of required_status_checks values across all branch_protection_v3s, keyed the same as var.branch_protection_v3s"
  value       = { for k, v in github_branch_protection_v3.branch_protection_v3s : k => one(v.required_status_checks) }
}
output "branch_protection_v3s_restrictions" {
  description = "Map of restrictions values across all branch_protection_v3s, keyed the same as var.branch_protection_v3s"
  value       = { for k, v in github_branch_protection_v3.branch_protection_v3s : k => one(v.restrictions) }
}

