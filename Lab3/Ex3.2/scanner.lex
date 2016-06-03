import java_cup.runtime.*;

%%

%class scanner
%cup
%unicode
%line
%column

nl              = \n|\r|\n\r
space           = [ \t]

%{
    private void debug(String str){
        System.out.println(str);
    }

    private Symbol symbol(int s) {
        return new Symbol(s, yyline, yycolumn);
    }
%}


%%

"int"                   {debug("INT"); return symbol(sym.INT);}
"double"                {debug("DOUBLE"); return symbol(sym.DOUBLE);}
"char"                  {debug("CHAR"); return symbol(sym.CHAR);}
"float"                 {debug("FLOAT"); return symbol(sym.FLOAT);}

"signed"                {debug("SIGNED"); return symbol(sym.SIGNED);}
"unsigned"              {debug("UNSIGNED"); return symbol(sym.UNSIGNED);}
"register"              {debug("REGISTER"); return symbol(sym.REGISTER);}
"long"                  {debug("LONG"); return symbol(sym.LONG);}
"short"                 {debug("SHORT"); return symbol(sym.SHORT);}
"extern"                {debug("EXTERN"); return symbol(sym.EXTERN);}
"static"                {debug("STATIC"); return symbol(sym.STATIC);}

"("                     {debug("RO"); return symbol(sym.RO);}
")"                     {debug("RC"); return symbol(sym.RC);}
"["                     {debug("SO"); return symbol(sym.SO);}
"]"                     {debug("SC"); return symbol(sym.SC);}
"{"                     {debug("BO"); return symbol(sym.BO);}
"}"                     {debug("BC"); return symbol(sym.BC);}
"+"                     {debug("PLUS"); return symbol(sym.PLUS);}
"%"                     {debug("MOD"); return symbol(sym.MOD);}
"-"                     {debug("MINUS"); return symbol(sym.MINUS);}
"*"                     {debug("STAR"); return symbol(sym.STAR);}
"/"                     {debug("DIV"); return symbol(sym.DIV);}
"="                     {debug("EQ"); return symbol(sym.EQ);}
">"                     {debug("GT"); return symbol(sym.GT);}
"<"                     {debug("LT"); return symbol(sym.LT);}
">="                    {debug("GE"); return symbol(sym.GE);}
"=>"                    {debug("GE"); return symbol(sym.GE);}
"<="                    {debug("LE"); return symbol(sym.LE);}
"=<"                    {debug("LE"); return symbol(sym.LE);}
"&"                     {debug("AND"); return symbol(sym.AND);}
"|"                     {debug("OR"); return symbol(sym.OR);}
"!"                     {debug("NOT"); return symbol(sym.NOT);}
";"                     {debug("S"); return symbol(sym.S);}
":"                     {debug("C"); return symbol(sym.S);}
","                     {debug("COMMA"); return symbol(sym.C);}

{space}|{nl}            {;}
"/*" ~ "*/"             {;}
"//".*{nl}              {;}
.                       {System.out.println("Error, not recognized char: "+yytext());}
