# stage/frontend-app/terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}