locals {
  aaa=3.12
  bbb               =""
  bbb1 = indent(2, join("\n", split("\n", somelist)))
  ccc1 = true
  ccc2 = false
  ccc3 = null
  vvv1 = expr == ttt ? "" > 0 ? 123.23 : false
  ccc4 = var.expr
  ccc9 = path.module
  ccc8 = "asdasdasd\"qweqweqwew"
  ccc5 = "${var.expr path.module + 2 + "32323" ? hghghg < : aaa == aaa iuyiuyiuy true}/asd"
  ccc7 = data.data_type.name
  ccc6 = module.test.output1
  ddd     = []
  ooo = {
    // gfhgfhgf
    aaa = "bbb",
    bbb = true,
    ccc = [
      "123",123
    ]
    ddd = {
      aaa = "bbb",
      bbb = true,
      ccc = [
        "123",123
      ]
    }
  }
  ccc5 = "${var.expr path.module + 2 + "32323" ? hghghg < : aaa == aaa iuyiuyiuy true}/asd"
  xxx = <<QWE
    kjlkjlkj ${var.expr path.module + 2 + "32323" ? hghghg : aaa == aaa iuyiuyiuy true}
  QWE
  xxx = <<-YYY
    lkjlkjlk ${var.expr path.module + 2 + "32323" ? hghghg : aaa == aaa iuyiuyiuy true}
  YYY
  ddd1=[""]
  ddd2=[
    // empty
  ]
  ddd3=[
    "asd",
    "zxcz",
    1,
    null,
    path.module,
    ["asd", "asd", 123, null]
  ]
  eee = indent(2, "ggggg")
  fff = indent(join("\n", [
    "qwe",
    "asd",
    data.template.rendered,
  ]))
}

variable "example" {
  type = any
}

locals {
  example = try(
    [tostring(var.example)],
    tolist(var.example),
  )
}

locals {
  raw_value = yamldecode(file("${path.module}/example.yaml"))
  normalized_value = {
    name   = tostring(try(local.raw_value.name, null))
    groups = try(local.raw_value.groups, [])
  }
}

locals {
  storage = defaults(var.storage, {
    # If "enabled" isn't set then it will default
    # to true.
    enabled = true

    # The "website" attribute is required, but
    # it's here to provide defaults for the
    # optional attributes inside.
    website = {
      index_document = "index.html"
      error_document = "error.html"
    }

    # The "documents" attribute has a map type,
    # so the default value represents defaults
    # to be applied to all of the elements in
    # the map, not for the map itself. Therefore
    # it's a single object matching the map
    # element type, not a map itself.
    documents = {
      # If _any_ of the map elements omit
      # content_type then this default will be
      # used instead.
      content_type = "application/octet-stream"
    }
  })
}

locals {
  namespace    = trimsuffix(replace(var.namespace, "\\", "/"), "/")
  test_escape = "\n \r \t \" \\ \u0x06 \u0x100b0f"
  name_prefix  = "/${local.namespace}"
}
