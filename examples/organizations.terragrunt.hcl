# This file and any other *.terragrunt.hcl that you can find in this repository was downloaded from https://github.com/antonbabenko

terraform {
  source = "${get_parent_terragrunt_dir()}/../../modules/organizations"
}

include {
  path = find_in_parent_folders()
}


inputs = {

}

locals {
  namespace    = trimsuffix(replace(var.namespace, "\\", "/"), "/")
  test_escape = "\n \r \t \" \\ \u0x06 \u0x100b0f"
  name_prefix  = "/${local.namespace}"
}
