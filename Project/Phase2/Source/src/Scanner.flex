import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.ComplexSymbolFactory.Location;
import java_cup.runtime.Symbol;

%%


%public
%class Scanner
%cup
%char
%line
%column


%{
    ComplexSymbolFactory symbolFactory;
    StringBuffer string = new StringBuffer();

    public Scanner(java.io.Reader in, ComplexSymbolFactory sf){
        this(in);
        symbolFactory = sf;
    }

    private Symbol symbol(String name, int sym) {
        return symbolFactory.newSymbol(name, sym, new Location(yyline + 1, yycolumn + 1, (int) yychar), new Location(yyline + 1, yycolumn + yylength(), (int) yychar + yylength()));
    }

    private Symbol symbol(String name, int sym, Object val) {
        Location left = new Location(yyline + 1, yycolumn + 1,(int) yychar);
        Location right= new Location(yyline + 1, yycolumn + yylength(), (int) yychar + yylength());
        return symbolFactory.newSymbol(name, sym, left, right, val);
    }

    private Symbol symbol(String name, int sym, Object val, int buflength) {
        Location left = new Location(yyline + 1, yycolumn + yylength() - buflength, (int) yychar + yylength() - buflength);
        Location right= new Location(yyline + 1, yycolumn + yylength(), (int) yychar + yylength());
        return symbolFactory.newSymbol(name, sym, left, right, val);
    }

    private void error(String message) {
        System.out.println("Error at line " + (yyline + 1) + ", column " + (yycolumn + 1) + " : " + message);
        throw new IllegalArgumentException("lexical");
    }
%}


%eofval{
     return symbolFactory.newSymbol("EOF", sym.EOF, new Location(yyline + 1, yycolumn + 1, (int) yychar), new Location(yyline + 1, yycolumn + 1, (int) yychar + 1));
%eofval}


DIGIT = [0-9]

INTEGER = "+"?{DIGIT}{DIGIT}*

NEG_INTEGER = "-"{DIGIT}{DIGIT}*

ALPHABET = [A-Za-z]

IDENTIFIER = {ALPHABET}({ALPHABET}|{DIGIT}|_)*

INPUT_CHARACTER = [^\r\n]

LINE_TERMINATOR = \r|\n|\r\n

WHITE_SPACE = {LINE_TERMINATOR}|[ \t\f]

COMMENT = {TRADITIONAL_COMMENT}|{END_OF_LINE_COMMENT}|{DOCUMENTATION_COMMENT}

TRADITIONAL_COMMENT = "/*"[^*]+"*/"|"/*""*"+"/"

END_OF_LINE_COMMENT = "//"{INPUT_CHARACTER}*{LINE_TERMINATOR}?

DOCUMENTATION_COMMENT = "/**"{COMMENT_CONTENT}"*"+"/"

COMMENT_CONTENT = ([^*]|\*+[^/*])*


%state STRING


%%


<YYINITIAL> {

  /* keywords */

  "int"                          { return symbol("int", sym.INT); }
  "void"                         { return symbol("void", sym.VOID); }
  "if"                           { return symbol("if", sym.IF); }
  "else"                         { return symbol("else", sym.ELSE); }
  "for"                          { return symbol("for", sym.FOR); }
  "new"                          { return symbol("new", sym.NEW); }
  "return"                       { return symbol("return", sym.RETURN); }

  /* boolean literals */

  "true"                         { return symbol("true", sym.TRUE); }
  "false"                        { return symbol("false", sym.FALSE); }

  /* separators */

  "("                            { return symbol("(",sym.LPAR); }
  ")"                            { return symbol(")",sym.RPAR); }
  "{"                            { return symbol("{",sym.BEGIN); }
  "}"                            { return symbol("}",sym.END); }
  ";"                            { return symbol(";",sym.SEMI); }
  ","                            { return symbol(",",sym.COMMA); }
  "."                            { return symbol(".",sym.DOT); }

  /* operators */

  "="                            { return symbol("=",sym.ASSIGN); }
  ">="                           { return symbol(">=",sym.GTEQ); }
  "!="                           { return symbol("!=",sym.NEQ); }
  "--"                           { return symbol("--",sym.DEC); }
  "+"                            { return symbol("+",sym.PLUS); }
  "-"                            { return symbol("-",sym.MINUS); }
  "%"                            { return symbol("%",sym.MOD); }
  \"                             { string.setLength(0); yybegin(STRING); }

  /* integers */

  {INTEGER}                      { return symbol("integer", sym.INTEGER, Integer.parseInt(yytext())); }
  {NEG_INTEGER}                  { return symbol("integer", sym.INTEGER, Integer.parseInt(yytext())); }

  /* identifiers */

  {IDENTIFIER}                   { return symbol("ident",sym.IDENT, yytext()); }

  /* whitespaces */

  {WHITE_SPACE}                  { /* ignore */ }

  /* comments */

  {COMMENT}                      { /* ignore */ }

}

<STRING> {
  \"                             { yybegin(YYINITIAL); return symbol("string", sym.STRING, string.toString(), string.length()); }
  [^\n\r\"\\]+                   { string.append(yytext()); }
  \\t                            { string.append('\t'); }
  \\n                            { string.append('\n'); }
  \\r                            { string.append('\r'); }
  \\\"                           { string.append('\"'); }
  \\                             { string.append('\\'); }
}

[^]                              { error("Illegal character <" + yytext() + ">"); }