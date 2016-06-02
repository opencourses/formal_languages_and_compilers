import java_cup.runtime.*;
%%

%cup
%unicode
%class scanner
%line
%coloumn

%{
    private void debug(String str) {
        if (true) {
            System.out.println(str);
        }
    }

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycoloumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycoloumn, value);
    }
%}

nl          = \r|\n|\n\r
ws          = [ \t]
id          = [A-Za-z_][A-Za-z0-9_]*
integer     = ([1-9][0-9]*|0)
double      = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?

%%

"("         {debug("RO"); return symbol(sym.RO);}
")"         {debug("RC"); return symbol(sym.RC);}
"{"         {debug("BO"); return symbol(sym.BO);}
"}"         {debug("BC"); return symbol(sym.BC);}
"["         {debug("SO"); return symbol(sym.SO);}
"]"         {debug("SC"); return symbol(sym.SC);}
"="         {debug("EQ"); return symbol(sym.EQ);}
"+"         {debug("PLUS"); return symbol(sym.PLUS);}
"-"         {debug("MINUS"); return symbol(sym.MINUS);}
"*"         {debug("STAR"); return symbol(sym.STAR);}
"/"         {debug("DIV"); return symbol(sym.DIV);}
"<"         {debug("LT"); return symbol(sym.LT);}
">"         {debug("GT"); return symbol(sym.GT);}
"<="        {debug("LE"); return symbol(sym.LE);}
">="        {debug("GE"); return symbol(sym.GE);}
"=>"        {debug("GE"); return symbol(sym.GE);}
"=<"        {debug("LE"); return symbol(sym.LE);}
"&"         {debug("AND"); return symbol(sym.AND);}
"|"         {debug("OR"); return symbol(sym.OR);}
"!"         {debug("NOT"); return symbol(sym.NOT);}

"int"       {debug("INT_TYPE"); return symbol(sym.INT_TYPE);}
"double"    {debug("DOUBLE_TYPE"); return symbol(sym.DOUBLE_TYPE);}

print       {debug("OR"); return symbol(sym.OR);}
if          {debug("OR"); return symbol(sym.OR);}
while       {debug("OR"); return symbol(sym.OR);}
else        {debug("OR"); return symbol(sym.OR);}
;           {debug("OR"); return symbol(sym.OR);}
:           {debug("OR"); return symbol(sym.OR);}

{id}        {debug("ID"); return symbol(sym.ID, yytext());}
{integer}   {debug("INT"); return symbol(sym.INT, new Integer(yytext()));}
{double}    {debug("DOUBLE"); return symbol(sym.DOUBLE, new Double(yytext()));}

"/*" ~ "*/" {;}
{ws}|{nl}   {;}

.           {System.out.println("Scanner error: "+yytext());}
