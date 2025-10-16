# Introduction 
TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project. 

# Getting Started
TODO: Guide users through getting your code up and running on their own system. In this section you can talk about:
1.	Installation process
2.	Software dependencies
3.	Latest releases
4.	API references

# Build and Test
TODO: Describe and show how to build your code and run the tests. 

# Contribute
TODO: Explain how other users and developers can contribute to make your code better. 

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.108.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azurerm_policy_definition"></a> [azurerm\_policy\_definition](#module\_azurerm\_policy\_definition) | git::https://entreprisegroup@dev.azure.com/entreprisegroup/TEMPLATE/_git/terraform.azurerm_policy_definition | v0.0.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_builtin_policies"></a> [builtin\_policies](#input\_builtin\_policies) | Map of built-in policies to assign (by definition\_id OR definition\_name).<br/>- Exactly one of: definition\_id OR definition\_name (exact Azure built-in name).<br/>- scopes: list of scope IDs.<br/>- not\_scopes: optional list of scope IDs to exclude.<br/>- effect: optional override (Deny\|Audit\|Disabled) if the definition has an 'effect' parameter.<br/>- assignment\_parameters: additional assignment parameter values. | <pre>map(object({<br/>    definition_id         = optional(string)<br/>    definition_name       = optional(string)<br/>    description           = string<br/>    scopes                = list(string)<br/>    not_scopes            = optional(list(string))<br/>    enforcement_mode      = optional(string, "Default")<br/>    effect                = optional(string)<br/>    assignment_parameters = optional(map(any))<br/>  }))</pre> | `{}` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment suffix used in assignment names (e.g., dev/int/qua/prd). | `string` | n/a | yes |
| <a name="input_policies"></a> [policies](#input\_policies) | Map of custom policies to define and assign.<br/>- parameters\_file: optional JSON file relative to module folder, used to extend the definition schema AND provide default assignment parameters.<br/>- target\_resources: alias keys referencing local.resource\_conditions. Use ["all"] to include all supported aliases.<br/>- scopes: list of scope IDs (subscriptionId \| resourceGroupId \| resourceId).<br/>- not\_scopes: optional list of scope IDs to exclude.<br/>- enforcement\_mode: "Default" means enforce=true.<br/>- effect: optional override of the Effect parameter (Deny\|Audit\|Disabled) at assignment time.<br/>- assignment\_parameters: extra assignment parameter values (merged with parameters\_file values). | <pre>map(object({<br/>    display_name          = string<br/>    description           = string<br/>    mode                  = string<br/>    parameters_file       = optional(string)<br/>    target_resources      = optional(list(string), ["all"])<br/>    scopes                = list(string)<br/>    not_scopes            = optional(list(string))<br/>    enforcement_mode      = optional(string, "Default")<br/>    effect                = optional(string)   # Deny | Audit | Disabled<br/>    assignment_parameters = optional(map(any)) # e.g., { myParam = "value" }<br/>  }))</pre> | `{}` | no |
| <a name="input_policy_exemptions"></a> [policy\_exemptions](#input\_policy\_exemptions) | Map of policy exemptions to create. Each item points to an existing assignment<br/>(custom or built-in) and may optionally expire.<br/><br/>Fields:<br/>- display\_name (string): friendly name<br/>- scope (string): target scope for the exemption (subscriptionId \| resourceGroupId \| resourceId)<br/>- assignment\_ref (object):<br/>    - type  (string): "custom" \| "builtin"<br/>    - level (string): "sub" \| "rg" \| "res"   (level of the *assignment* you’re exempting)<br/>    - policy\_key (string): for "custom", the key from var.policies; for "builtin", the key from var.builtin\_policies<br/>    - scope (string): the exact scope string used by the assignment you’re exempting<br/>- category (optional string): "Mitigated" \| "Waiver" (default "Mitigated")<br/>- expires\_on (optional string): RFC3339 UTC timestamp, e.g. "2025-12-31T23:59:59Z"<br/>- description (optional string)<br/>- metadata (optional map(any)): arbitrary metadata; will be jsonencoded<br/>- policy\_definition\_reference\_ids (optional list(string)): for initiatives, list of definition reference IDs | <pre>map(object({<br/>    display_name = string<br/>    scope        = string<br/>    assignment_ref = object({<br/>      type       = string # "custom" | "builtin"<br/>      level      = string # "sub" | "rg" | "res" (assignment level)<br/>      policy_key = string # key from var.policies or var.builtin_policies<br/>      scope      = string # scope string used by the assignment<br/>    })<br/>    category                        = optional(string) # "Mitigated" | "Waiver"<br/>    expires_on                      = optional(string) # RFC3339 "YYYY-MM-DDThh:mm:ssZ"<br/>    description                     = optional(string)<br/>    metadata                        = optional(map(any))<br/>    policy_definition_reference_ids = optional(list(string))<br/>  }))</pre> | `{}` | no |
| <a name="input_use_policy_assignment"></a> [use\_policy\_assignment](#input\_use\_policy\_assignment) | Create Policy Assignments for both custom and built-in. | `bool` | `true` | no |
| <a name="input_use_policy_definition"></a> [use\_policy\_definition](#input\_use\_policy\_definition) | Create custom Policy Definitions from var.policies. | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->