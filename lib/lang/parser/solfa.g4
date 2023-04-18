/* ANTLR4 Grammar for SolFa musical programming language
*/

grammar solfa;

script : form* EOF;

form
     : squash
     | literal
     | list_
     | sequence
     | concurrent
     ;

forms : form* ;

list_ : '(' forms ')' ;

sequence : '[' forms ']' ;

concurrent : '&[' forms ']' ;

squash : squash_ duration
       | squash_
       ;

squash_ : '{' forms '}' ;

literal
     : number
     | string
     | nil
     | boolean
     | symbol_like
     ;

string : STRING ;
nil : NIL ;
boolean : BOOLEAN ;

duration : DOTTED | INT ;

number
  : int_
  | float_
  ;

int_ : INT ;
float_: FLOAT ;

symbol_like : SYMBOL_LIKE ;

//-----------------------------------------
// LEXERS
//-----------------------------------------

STRING : '"' ( ~'"' | '\\' '"')* '"' ;

DOTTED : [0-9]+ '.'+  ;

FLOAT : '-'? [0-9]+ '.' [0-9]+ ;

INT : '-'? [0-9]+ ;

NIL : 'nil' ;

BOOLEAN: 'true' | 'false' ;

SYMBOL_LIKE : [a-zA-Z<>!=@%\-+\\/?*] [a-zA-Z0-9_\-+.~=!\\/?*]* ;

TRASH : ( WS | COMMENT ) -> skip ;

fragment
WS : [ \n\r\t,] ;

fragment
COMMENT: ';' ~[\r\n]* ;

