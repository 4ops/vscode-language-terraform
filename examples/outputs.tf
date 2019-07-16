output "droplet" {
  value = digitalocean_droplet.server
}

output "name" {
  value = data.template_file.name[*].rendered
}

output "fqdn" {
  value = data.template_file.fqdn[*].rendered
  sensitive = true
}

output "name" {
  value = data.template_file.name[*].rendered
  description = <<-DOC
    blah blah blah
    blah lasjdkaslkdjalksjdlkjaskd
    lasjdkaslkdjalksjdlkjaskd
    // asdasd 333
    vvvvv
  DOC
}

output "fqdn" {
  value = data.template_file.fqdn[*].rendered
  description = "lasjdkaslkdjalksjdlkjaskd"
}

