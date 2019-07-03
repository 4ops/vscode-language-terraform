  h  i
#comment
  not-a-comment
//  comment
/*     *           comment */
    /*  cff

    fd
h  i
  afffb

b    */
 not-a-comment  # comment
      //       comment
           /**/ not-a-commentk

  not-a-comment # comment
      not-a-comment//comment
           not-a-comment/*comment*/not-a-comment

  not-a-comment # */ comment
      not-a-comment//
           not-a-comment/**/not-a-comment

 //#// line comment // line comment /* comment block */
// line comment  # line comment /* comment block */
/*comment block */ // line comment  # line comment

/* /*
# line comment
// line comment
  /* line comment */
*/ // <----- not-a-comment at begin of line but this is a comment

/** comment*/
//comment*/
#comment*/
/*comment*/

/************************************************/
#/****************************************/#################

/
*
*/

string-test "#" not-a-comment


string-test "//" not-a-comment

         string-test "\"/*comment" must-be-comment          "/*comment*/" not-a-comment

string-test "/*comment*/" not-a-comment

var1=<<NOTACOMMENTINSIDE
# not-a-comment
  // not-a-comment
  /* not-a-comment */
  /* not-a-comment */ // not-a-comment # not-a-comment
NOTACOMMENTINSIDE

var2/*comment*/=/*comment*/value//comment
var3/*comment*/=/*comment*/"value"//comment
var4/*comment*/=/*comment*/<<NOTACOMMENTINSIDE//comment
# not-a-comment
  // not-a-comment
  /* not-a-comment */
  /* not-a-comment */ // not-a-comment # not-a-comment
NOTACOMMENTINSIDE #comment
