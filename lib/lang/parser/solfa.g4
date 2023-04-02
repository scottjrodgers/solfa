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
     | STRING
     | NIL
     | BOOLEAN
     | symbol_like
     ;

duration : DOTTED | INT ;

number
  : int_
  | float_
  ;

int_ : INT ;
float_: FLOAT ;

symbol_like : SYMBOL_LIKE ;


//-----------------------------------------
// KEYWORDS
//-----------------------------------------

//IF : 'if' ;
//ADD: 'add' ;
//SUB: 'sub' ;
//MULT: 'mult' ;
//DIV: 'div' ;
//MOD: 'mod' ;
//DEFN: 'defn' ;
//LET: 'let' ;
//DEF: 'def' ;
//SET: 'set' ;
//SET_GLOBAL: 'set!' ;
//EQ: 'eq?' ;
//LT: 'lt?' ;
//GT: 'gt?' ;
//NE: 'ne?' ;
//LTE: 'lte?' ;
//GTE: 'gte?' ;
//AND: 'and' ;
//OR: 'or' ;
//NOT: 'not' ;
//INC: 'inc' ;
//DEC: 'dec' ;
//AT: '@' ;
//PERCENT: '%' ;
//PLUS: '+'  ;
//MINUS: '-' ;
//UNDERSCORE: '_' ;
//F_SLASH: '/' ;
//B_SLASH: '\\' ;

//-----------------------------------------
// LEXERS
//-----------------------------------------
//SCALE_TONES: [a-g] ;

STRING : '"' ( ~'"' | '\\' '"')* '"' ;

DOTTED : [0-9]+ '.'+  ;

FLOAT : '-'? [0-9]+ '.' [0-9]+ ;

INT : '-'? [0-9]+ ;

NIL : 'nil' ;

BOOLEAN: 'true' | 'false' ;

SYMBOL_LIKE : [a-zA-Z<>!=@%] [a-zA-Z0-9_\-+.~=\\/?*]* ;

TRASH : ( WS | COMMENT ) -> skip ;

fragment
WS : [ \n\r\t,] ;

fragment
COMMENT: ';' ~[\r\n]* ;

