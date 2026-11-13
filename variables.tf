variable "rate_limitings" {
  description = <<EOT
Map of rate_limitings, attributes below
Required:
    - default_mode
Optional:
    - use_case_mode_overrides (block):
        - login_page (optional)
        - oauth2_authorize (optional)
        - oie_app_intent (optional)
EOT

  type = map(object({
    default_mode = string
    use_case_mode_overrides = optional(list(object({
      login_page       = optional(string)
      oauth2_authorize = optional(string)
      oie_app_intent   = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.rate_limitings : (
        contains(["DISABLE", "ENFORCE", "PREVIEW"], v.default_mode)
      )
    ])
    error_message = "must be one of: \"DISABLE\", \"ENFORCE\", \"PREVIEW\""
  }
  validation {
    condition = alltrue([
      for k, v in var.rate_limitings : (
        v.use_case_mode_overrides == null || alltrue([for item in v.use_case_mode_overrides : (item.login_page == null || (contains(["DISABLE", "ENFORCE", "PREVIEW"], item.login_page)))])
      )
    ])
    error_message = "must be one of: \"DISABLE\", \"ENFORCE\", \"PREVIEW\""
  }
  validation {
    condition = alltrue([
      for k, v in var.rate_limitings : (
        v.use_case_mode_overrides == null || alltrue([for item in v.use_case_mode_overrides : (item.oauth2_authorize == null || (contains(["DISABLE", "ENFORCE", "PREVIEW"], item.oauth2_authorize)))])
      )
    ])
    error_message = "must be one of: \"DISABLE\", \"ENFORCE\", \"PREVIEW\""
  }
  validation {
    condition = alltrue([
      for k, v in var.rate_limitings : (
        v.use_case_mode_overrides == null || alltrue([for item in v.use_case_mode_overrides : (item.oie_app_intent == null || (contains(["DISABLE", "ENFORCE", "PREVIEW"], item.oie_app_intent)))])
      )
    ])
    error_message = "must be one of: \"DISABLE\", \"ENFORCE\", \"PREVIEW\""
  }
}

