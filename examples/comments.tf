locals{// comment
  var1 = "value #asd /*1*/" // comment
  var2 = 3         # comment
/*sdfsadf*/var3 = false#aaa
  var5=1//
  var6/*       */=/*        */null//aaa
}
/kjlkj                   // *** not valid ***
   / /;lk;l              // *** not valid ***
  #as
#as
//as
block {
fff = <<DOC
  /* sdfsdf */
DOC

ggg = "${value} $${value}               %{if var.name == ""}${other_value}%{endif                                ~}"

fff = <<DOC
  ${value}
  %{if var.name == ""}
               $${other_value}                  ${other_value}
  %{                else  }
   lkjlkjlkjlkj
  %{endif                                ~}
DOC
}
/**/

locals {
 aaa= false

 b =      var.name == "" ? "1" : local.value ? true : "false"
                        c                      =(a && b)
/*} */
     }

# sdfsdfsdfsdfdfsdf '*/

   //
   //lkjlkjlkj
// kijlkjlkj
     #aaa
     #hhh
       / / / / / #cco     // *** not valid ***
//123
                      locals{// comment
  var1 = "value 1" // comment
  var2 = 3         # comment
/*sdfsadf*/var3 = (local.value == false)#aaa



/*  var.name = max([14, local.num]) */name = max([14, local.num])

  var5=1//
  var6/*       */=/*        */null//aaa
}
/*sdfsadf*/locals               {// comment
  var1 = "value 1" // comment
  var2 = 3         # comment
/*sdfsadf*/var3 = false#aaa
  var5=1//
  var6/*       */=/*        */null//aaa
}
locals{						// comment
  var1 = "value 1" // comment
  var2 /*       */ = 3         # comment
/*sdfsadf*/var3 = false#aaa
  var5=1//
  var6/*       */=/*        */null//aaa
}
locals					{// comment
}
locals					{}

