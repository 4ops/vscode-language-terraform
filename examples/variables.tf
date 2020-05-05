   variable    "empty_test" {}

variable empty-test     {

}

variable     "name" {
  type = string

  default = "bitcoin"

  description = <<-DESCRIPTION
    Name of service.
    Used as name prefix when generating hostnames.
  DESCRIPTION
}

variable some_variable {
  type = map

  default = {
    foo = "bar",
    bar = 1,
    one = true,
  }

  description = <<-DESCRIPTION
    Variable
    description
    with heredoc...
  DESCRIPTION

  invalid_word = "value"
}

variable "random_id" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Appends random id to droplet's name if `true`.
  DESCRIPTION
}

variable "tags" {
  type = list

  default = []

  description = <<-DESCRIPTION
    List of existing tags for droplet.
  DESCRIPTION
}

variable "size" {
  type = string

  default = "s-2vcpu-4gb"

  description = <<-DESCRIPTION
    Size of droplet.
  DESCRIPTION
}

variable "ipv6" {
  type = bool

  default = false

  description = <<-DESCRIPTION
    Enable IPv6 address on droplet.
  DESCRIPTION
}

    variable    "bitcoin_testnet_extra_args"     {
  type = list

  default = [
    "-testnet",
    "-feefilter=0",
    "-acceptnonstdtxn=1",
    "-incrementalrelayfee=0.00000001",
    "-dustrelayfee=0.00000001",
    "-minrelaytxfee=0.00000001",
    "-blockmintxfee=0.00000001",
  ]

  description = <<-DESCRIPTION
    Bitcoin extra arguments for testnet.
  DESCRIPTION
}
