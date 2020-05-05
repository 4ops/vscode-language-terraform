output test {
  value = local.test_value
}

output name {
  value = data.template_file.name[*].rendered
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

