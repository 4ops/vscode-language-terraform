variable test {
  default = 123
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.0"

  create_vpc = length(var.vpc_id) == 0

  name = var.name

  cidr           = var.vpc_cidr
  azs            = [for v in data.aws_availability_zones.available.names : v]
  public_subnets = [for k, v in data.aws_availability_zones.available.names : cidrsubnet(var.vpc_cidr, 8, k)]

  enable_ipv6                     = true
  assign_ipv6_address_on_creation = true
  public_subnet_ipv6_prefixes     = [for k, v in data.aws_availability_zones.available.names : k]

  tags = local.tags
}

check "health_check" {
  data "http" "terraform_io" {
    url = "https://www.terraform.io"
  }

  assert {
    condition = data.http.terraform_io.status_code == 200
    error_message = "${data.http.terraform_io.url} returned an unhealthy status code"
  }
}