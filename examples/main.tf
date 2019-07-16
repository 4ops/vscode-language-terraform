terraform {
  version = "~> 0.12.1"

  required_providers {
    digitalocean = "~> 1.4"
    random       = "~> 2.1"
    template     = "~> 2.1"
    tls          = "~> 2.0"
    null         = "~> 2.1"
  }
}

module "hostname" {
  source    = "4ops/hostname-generator/template"
  version   = "1.0.0"
  prefix    = var.name
  domain    = var.domain
  random_id = var.random_id

}

locals  {
  {
  all_hosts = ["0.0.0.0/0", "::/0"]
  all_ports = "1-65535"

  bitcoin_rpc_password = var.bitcoin_rpc_password != "" ? var.bitcoin_rpc_password : join("", random_string.bitcoin_rpc_password[*].result)
  bitcoin_extra_args   = var.bitcoin_network == "testnet" ? var.bitcoin_testnet_extra_args : var.bitcoin_mainnet_extra_args

  service_dir = "/srv/${var.name}"
}

      resource aa "tls_priv{ate_key" "provisioner" {
  count = var.servers > 0 ? 1 : 0    }

  algorithm   = "ECDSA"
  ecdsa_curve = "P521"
}

   resource "digitalocean_firewall" "network_policy" {
  count = var.servers > 0 ? 1 : 0

  name = "droplet-policy-${var.name}"

  droplet_ids = digitalocean_droplet.server[*].id

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = var.trusted_sources
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "8332"
    source_addresses = var.trusted_sources
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "18332"
    source_addresses = var.trusted_sources
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "8333"
    source_addresses = local.all_hosts
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "18333"
    source_addresses = local.all_hosts
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = local.all_ports
    destination_addresses = local.all_hosts
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = local.all_ports
    destination_addresses = local.all_hosts
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = local.all_hosts
  }
}

resource "digitalocean_volume" "data_volume" {
  count = var.servers

  name   = "${module.hostname.name[count.index]}-data"
  region = var.region
  size   = var.volume_size

  initial_filesystem_label = "data"
  initial_filesystem_type  = "xfs"
}

resource "digitalocean_droplet" "server" {
  count = var.servers

  name               = module.hostname.name[count.index]
  tags               = var.tags
  region             = var.region
  size               = var.size
  backups            = var.backups
  monitoring         = var.monitoring
  ipv6               = var.ipv6
  ssh_keys           = var.ssh_keys
  private_networking = var.private_networking
  user_data          = data.template_file.cloud_config[count.index].rendered
  volume_ids         = [digitalocean_volume.data_volume[count.index].id]

  image       = "docker-18-04"
  resize_disk = false

  lifecycle {
    ignore_changes = ["user_data", "image"]
  }

  connection {
    host        = self.ipv4_address
    user        = var.provisioner_username
    private_key = tls_private_key.provisioner[count.index].private_key_pem
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    inline = ["cloud-init status --wait > /dev/null"]
  }
}

data "digitalocean_record" "a" {
  count = var.domain != "" ? var.servers : 0

  type = "A"

  domain = var.domain
  name   = digitalocean_droplet.server[count.index].name
  value  = digitalocean_droplet.server[count.index].ipv4_address
  ttl    = var.domain_ttl
}

resource "digitalocean_record" "aaaa" {
  count = var.ipv6 && var.domain != "" ? var.servers : 0

  type = "AAAA"

  domain = var.domain
  name   = digitalocean_droplet.server[count.index].name
  value  = digitalocean_droplet.server[count.index].ipv6_address
  ttl    = var.domain_ttl
}

resource "null_resource" "update_docker_compose_config" {
  count = var.servers

  triggers = {
    droplet_id_changed            = digitalocean_droplet.server[count.index].id
    docker_compose_config_changed = sha256(data.template_file.docker_compose_config.rendered)
  }

  connection {
    type    = "ssh"
    timeout = "2m"

    host        = digitalocean_droplet.server[count.index].ipv4_address
    user        = var.provisioner_username
    private_key = tls_private_key.provisioner[count.index].private_key_pem
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p ${local.service_dir}",
      "sudo chown ${var.provisioner_username}:docker ${local.service_dir}",
      "chmod 0750 ${local.service_dir}",
    ]
  }

  provisioner "file" {
    content     = data.template_file.docker_compose_config.rendered
    destination = "${local.service_dir}/docker-compose.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "cd ${local.service_dir}",
      "docker-compose config --quiet",
      "docker-compose pull --quiet",
      "docker-compose up --detach",
    ]
  }
}

resource "null_resource" "resize_data_volume" {
  count = var.servers

  depends_on = [digitalocean_droplet.server, digitalocean_volume.data_volume]

  triggers = {
    volume_size_changed = var.volume_size
  }

  connection {
    type    = "ssh"
    timeout = "2m"

    host        = digitalocean_droplet.server[count.index].ipv4_address
    user        = var.provisioner_username
    private_key = tls_private_key.provisioner[count.index].private_key_pem
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 30",
      "sudo xfs_growfs /dev/disk/by-label/${digitalocean_volume.data_volume[count.index].filesystem_label}",
    ]
  }
}
