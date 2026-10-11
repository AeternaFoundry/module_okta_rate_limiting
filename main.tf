resource "okta_rate_limiting" "rate_limitings" {
  for_each = var.rate_limitings

  default_mode = each.value.default_mode

  dynamic "use_case_mode_overrides" {
    for_each = each.value.use_case_mode_overrides != null ? each.value.use_case_mode_overrides : []
    content {
      login_page       = use_case_mode_overrides.value.login_page
      oauth2_authorize = use_case_mode_overrides.value.oauth2_authorize
      oie_app_intent   = use_case_mode_overrides.value.oie_app_intent
    }
  }
}

