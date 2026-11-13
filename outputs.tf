output "rate_limitings_id" {
  description = "Map of id values across all rate_limitings, keyed the same as var.rate_limitings"
  value       = { for k, v in okta_rate_limiting.rate_limitings : k => v.id }
}
output "rate_limitings_default_mode" {
  description = "Map of default_mode values across all rate_limitings, keyed the same as var.rate_limitings"
  value       = { for k, v in okta_rate_limiting.rate_limitings : k => v.default_mode }
}
output "rate_limitings_use_case_mode_overrides" {
  description = "Map of use_case_mode_overrides values across all rate_limitings, keyed the same as var.rate_limitings"
  value       = { for k, v in okta_rate_limiting.rate_limitings : k => v.use_case_mode_overrides }
}

