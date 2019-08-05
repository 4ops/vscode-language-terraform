   variable    "empty_test" {}

variable "empty-test"     {

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

variable "domain" {
  type = string

  default = ""

  description = <<-DESCRIPTION
    Domain name.
    Host will be registered in this domain if non-empty value assigned.
  DESCRIPTION
}

variable "domain_ttl" {
  type = number

  default = 300

  description = <<-DESCRIPTION
    TTL in seconds for domain records.
  DESCRIPTION
}

variable "region" {
  type = string

  description = <<-DESCRIPTION
    Required.
    DigitalOcean region for droplet creation.
  DESCRIPTION
}

variable "ssh_keys" {
  type = list

  default = []

  description = <<-DESCRIPTION
    List of SSH keys registered in DigitalOcean.
    User `root` authorized with this keys.
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

variable "backups" {
  type = bool

  default = false

  description = <<-DESCRIPTION
    Enable backups feature for droplet.
  DESCRIPTION
}

variable "ipv6" {
  type = bool

  default = false

  description = <<-DESCRIPTION
    Enable IPv6 address on droplet.
  DESCRIPTION
}

variable "private_networking" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Enable DigitalOcean private networking.
  DESCRIPTION
}

variable "monitoring" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Enable DigitalOcean monitoring.
  DESCRIPTION
}

variable "volume_size" {
  type = number

  default = 50

  description = <<-DESCRIPTION
    Size of data volume in gigabytes.
  DESCRIPTION
}

variable "trusted_sources" {
  type = list

  description = <<-DESCRIPTION
    Required.
    IP list to allow SSH and bitcoin rpc connections from.
  DESCRIPTION
}

variable "provisioner_username" {
  type = string

  default = "provisioner"

  description = <<-DESCRIPTION
    This user will be added and used inside this module only.
  DESCRIPTION
}

variable "provisioner_homedir" {
  type = string

  default = "/home/provisioner"

  description = <<-DESCRIPTION
    Home directory of `provisioner_username`.
  DESCRIPTION
}

# Service configuration

variable "bitcoin_image" {
  type = string

  default = "4ops/bitcoin-core:v0.18.0"

  description = <<-DESCRIPTION
    Bitcoin core docker image tag.
  DESCRIPTION
}

variable "bitcoin_network" {
  type = string

  default = "testnet"

  description = <<-DESCRIPTION
    Bitcoin network name.
    Only supported values: `mainnet` or `testnet`
  DESCRIPTION
}

variable "bitcoin_rpc_user" {
  type = string

  default = "bitcoin_core_user"

  description = <<-DESCRIPTION
    Username for accessing to bitcoin rpc.
  DESCRIPTION
}

variable "bitcoin_rpc_password" {
  type = string

  default = ""

  description = <<-DESCRIPTION
    Password for accessing to bitcoin rpc.
    If value is empty, random password will be generated.
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

variable "bitcoin_mainnet_extra_args" {
  type = list

  default = []

  description = <<-DESCRIPTION
    Bitcoin extra arguments for mainnet.
  DESCRIPTION
}
