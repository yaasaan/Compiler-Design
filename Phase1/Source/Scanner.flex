/* Mixture of jflex examples: simple.flex, minijava.flex and java.flex (with modifications) */

%%



%public
%standalone
%class Scanner

%caseless
%unicode
%debug

%line
%column



DIGIT = [0-9]

INTEGER = "+"?{DIGIT}{DIGIT}*

NEG_INTEGER = "-"{DIGIT}{DIGIT}*

FLOAT = "+"?({DIGIT}*"."{DIGIT}{DIGIT}*|{DIGIT}{DIGIT}*"."{DIGIT}*)

NEG_FLOAT = "-"({DIGIT}*"."{DIGIT}{DIGIT}*|{DIGIT}{DIGIT}*"."{DIGIT}*)

ALPHABET = [A-Za-z]

IDENTIFIER = {ALPHABET}({ALPHABET}|{DIGIT}|_)*

INCREMENTAL_STATEMENT = {IDENTIFIER}"++"|"++"{IDENTIFIER}

DECREMENTAL_STATEMENT = {IDENTIFIER}"--"|"--"{IDENTIFIER}

INPUT_CHARACTER = [^\r\n]

LINE_TERMINATOR = \r|\n|\r\n

WHITE_SPACE = {LINE_TERMINATOR}|[ \t\f]

COMMENT = {TRADITIONAL_COMMENT}|{END_OF_LINE_COMMENT}|{DOCUMENTATION_COMMENT}

TRADITIONAL_COMMENT = "/*"[^*]+"*/"|"/*""*"+"/"

END_OF_LINE_COMMENT = "//"{INPUT_CHARACTER}*{LINE_TERMINATOR}?

DOCUMENTATION_COMMENT = "/**"{COMMENT_CONTENT}"*"+"/"

COMMENT_CONTENT = ([^*]|\*+[^/*])*



%%



<YYINITIAL> {

  /* reserved */

  "compiler"                     { System.out.println("     reserved" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "dxt.init()"                   { System.out.println("     reserved" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "EOF"                          { System.out.println("     reserved" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }

  /* keywords */

  "abstract"                     { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "boolean"                      { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "break"                        { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "byte"                         { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "case"                         { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "catch"                        { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "char"                         { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "class"                        { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "const"                        { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "continue"                     { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "do"                           { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "double"                       { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "else"                         { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "extends"                      { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "final"                        { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "finally"                      { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "float"                        { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "for"                          { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "default"                      { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "implements"                   { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "import"                       { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "instanceof"                   { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "int"                          { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "interface"                    { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "long"                         { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "native"                       { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "new"                          { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "goto"                         { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "if"                           { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "public"                       { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "short"                        { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "super"                        { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "switch"                       { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "synchronized"                 { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "package"                      { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "private"                      { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "protected"                    { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "transient"                    { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "return"                       { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "void"                         { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "static"                       { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "while"                        { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "this"                         { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "throw"                        { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "throws"                       { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "try"                          { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "volatile"                     { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "strictfp"                     { System.out.println("     keyword" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }

  /* boolean literals */

  "true"                         { System.out.println("     boolean literal" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "false"                        { System.out.println("     boolean literal" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }

  /* null literal */

  "null"                         { System.out.println("     null literal" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }

  /* separators */

  "("                            { System.out.println("     separator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  ")"                            { System.out.println("     separator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "{"                            { System.out.println("     separator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "}"                            { System.out.println("     separator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "["                            { System.out.println("     separator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "]"                            { System.out.println("     separator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  ";"                            { System.out.println("     separator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  ","                            { System.out.println("     separator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "."                            { System.out.println("     separator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }

  /* operators */

  "="                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  ">"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "<"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "!"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "~"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "?"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  ":"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "=="                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "<="                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  ">="                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "!="                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "&&"                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "||"                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "++"                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "--"                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "+"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "-"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "*"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "/"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "&"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "|"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "^"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "%"                            { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "<<"                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  ">>"                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  ">>>"                          { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "+="                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "-="                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "*="                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "/="                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "&="                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "|="                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "^="                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "%="                           { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  "<<="                          { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  ">>="                          { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  ">>>="                         { System.out.println("     operator" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }

  /* integers/floats */

  {INTEGER}                      { System.out.println("     integer" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  {NEG_INTEGER}                  { System.out.println("     negative integer" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  {FLOAT}                        { System.out.println("     float" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  {NEG_FLOAT}                    { System.out.println("     negative float" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }

  /* identifiers */

  {IDENTIFIER}                   { System.out.println("     identifier" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }

  /* incremental/decremental statements */

  {INCREMENTAL_STATEMENT}        { System.out.println("     incremental statement" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }
  {DECREMENTAL_STATEMENT}        { System.out.println("     decremental statement" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }

  /* whitespaces */

  {WHITE_SPACE}                  { /* ignore */ }
  
  /* comments */

  {COMMENT}                      { /* ignore */ }

}

.                                { System.out.println("     illegal character" + " ~~~ " + yytext() + " ~~~ line:" + yyline + " column:" + yycolumn); }