# This file and any other *.terragrunt.hcl that you can find in this repository was downloaded from https://github.com/antonbabenko

terraform {
  source = "${get_parent_terragrunt_dir()}/../../modules/aws-data"
}

include {
  path = find_in_parent_folders()
}


inputs = {

}
