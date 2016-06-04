import java_cup.runtime.*;
%%

%cup
%class scanner
%unicode
%line
%column

%{
    private static final boolean DEBUG = false;
    private void debug (String str) {
        if (DEBUG)
            System.out.println(str);
    }
    private void debug (String token, String value) {
        if (DEBUG)
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
{lower_letter}      {debug("VARIABLE"); return symbol(sym.VARIABLE); }
{upper_letter}      {debug("VECTOR"); return symbol(sym.VECTOR); }
{real}              {debug("REAL"); return symbol(sym.REAL); }
"["                 {debug("SO"); return symbol(sym.SO); }
"]"                 {debug("SC"); return symbol(sym.SC); }
"("                 {debug("RO"); return symbol(sym.RO); }
")"                 {debug("RC"); return symbol(sym.RC); }
";"                 {debug("S"); return symbol(sym.S); }
"^"                 {debug("P"); return symbol(sym.P); }
"*"                 {debug("STAR"); return symbol(sym.STAR); }
"/"                 {debug("DIV"); return symbol(sym.DIV); }
"."                 {debug("DOT"); return symbol(sym.DOT); }
"+"                 {debug("PLUS"); return symbol(sym.PLUS); }
"-"                 {debug("MINUS"); return symbol(sym.MINUS); }
"="                 {debug("EQ"); return symbol(sym.EQ); }
","                 {debug("COMMA"); return symbol(sym.COMMA); }
"?"                 {debug("QMARK"); return symbol(sym.QMARK); }
.                   {debug("Symbol not recognized",yytext()); 
                     return symbol(sym.error); }
