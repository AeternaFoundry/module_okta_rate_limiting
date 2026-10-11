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
}

