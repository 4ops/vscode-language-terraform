#qwe    locals {}  locals "type" "name" {
//wer locals {}  locals "type" "name" {
  /*
  locals {}  locals "type" "name" {
    */

var1 = "value 1"


terraform {
  //
}
    locals "not-valid" {
var1 = "value1"
    }

    provider                            not-valid {


          provider"valid" {
          }
variable "" {
  default = ""
}

variable {
  1default = ""
}

locals {
  count = 123
  varstr = "asd"
}
/*
locals {
  count = 123
  varstr = "asd"
}
*/

/*comment*/local/*comment*/{#comment
/*comment*/count/*comment*/=/*comment*/123/*comment*/
/*comment*/varstr/*comment*/=/*comment*/"asd"#comment
}/*comment*/

variable {
  default = var.name == "no interpolations in variables" ? 1 : 0
}
