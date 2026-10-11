output "rate_limitings_id" {
  description = "Map of id values across all rate_limitings, keyed the same as var.rate_limitings except keys with no id are omitted"
  value       = { for k, v in okta_rate_limiting.rate_limitings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "rate_limitings_default_mode" {
  description = "Map of default_mode values across all rate_limitings, keyed the same as var.rate_limitings except keys with no default_mode are omitted"
  value       = { for k, v in okta_rate_limiting.rate_limitings : k => v.default_mode if v.default_mode != null && length(v.default_mode) > 0 }
}
output "rate_limitings_use_case_mode_overrides" {
  description = "Map of use_case_mode_overrides values across all rate_limitings, keyed the same as var.rate_limitings except keys with no use_case_mode_overrides are omitted"
  value       = { for k, v in okta_rate_limiting.rate_limitings : k => v.use_case_mode_overrides if v.use_case_mode_overrides != null && length(v.use_case_mode_overrides) > 0 }
}

