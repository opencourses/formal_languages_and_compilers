import java_cup.runtime.*;
%%

%standalone
%class scanner
%unicode
%line
%column

%{
    private void debug (String str) {
        System.out.println(str);
    }
    private void debug (String token, String value) {
        System.out.println(token+": "+value);
    }
    private Symbol symbol(int sym){
        return new Symbol(sym, yyline, yycolumn);
    }
%}

nl              = \n|\r|\n\r
number          = ([0-9])
lower_letter    = [a-z]
upper_letter    = [A-Z]
real            = {integer}(\.{number}+)?{exponent}?
integer         = ([1-9][0-9]*|0)
exponent        = (e|E)(((\-|\+)?[1-9])|0)

%%
{nl}|" "|"\t"       {;}
{lower_letter}      {debug("LOWER"); }
{upper_letter}      {debug("UPPER"); }
"["                 {debug("SO"); }
"]"                 {debug("SC"); }
"("                 {debug("RO"); }
")"                 {debug("RC"); }
";"                 {debug("C"); }
"^"                 {debug("P"); }
"*"                 {debug("STAR"); }
"/"                 {debug("DIV"); }
"."                 {debug("DOT"); }
"+"                 {debug("PLUS"); }
"-"                 {debug("MINUS"); }
"="                 {debug("EQ"); }
","                 {debug("COMMA"); }
"?"                 {debug("QMARK"); }
{real}              {debug("REAL"); }
.                   {debug("Symbol not recognized",yytext()); }
