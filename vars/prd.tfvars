env = "prd"
policies = {
  "deny-public-access" = {
    display_name          = "deny public access"
    description           = "Prevents sensitive services from being publicly exposed"
    mode                  = "All"
    target_resources      = ["all"]
    scopes                = ["/subscriptions/exemple_sub/resourceGroups/exemple_rg"]
    not_scopes            = []
    enforcement_mode      = "Default"
    effect                = "Deny"
    assignment_parameters = {} # if any extra params
  }
}