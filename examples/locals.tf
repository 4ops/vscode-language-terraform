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
