import java_cup.runtime.*;
%%

%cup
%class scanner
%unicode
%line
%column

%{
    private void debug(String str){
        // Decomment this to get the scanner debug
        //System.out.println(str);
    }
    private Symbol symbol(int sym){
        return new Symbol(sym, yyline, yycolumn);
    }
%}

nl              = \n|\r|\n\r
integer         = ([1-9][0-9]*|0)
real            = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) 
sign            = ("-"|"+")
exponent        = (e|E('+'|'-')?[0-9]+)

atom_prefix     = ([a-z]|({sign}?({integer}|{real}){exponent}?))
atom_suffix     = ([A-Za-z0-9_])
atom            = {atom_prefix}{atom_suffix}*
variable        = [A-Z_]([A-Za-z0-9_])*

%%

"."             {debug("DOT"); return symbol(sym.DOT); }
":-"            {debug("END_RULE"); return symbol(sym.END_RULE); }
"?-"            {debug("START_QUESTION"); return symbol(sym.START_QUESTION); }
","             {debug("COMMA"); return symbol(sym.COMMA); }
"("             {debug("RO"); return symbol(sym.RO); }
")"             {debug("RC"); return symbol(sym.RC); }

{atom}          {debug("ATOM"); return symbol(sym.ATOM); }
{variable}      {debug("VARIABLE"); return symbol(sym.VARIABLE); }

{nl}|" "        {;}
"/*" ~ "*/"     {debug("COMMENT");}
.               {System.out.println("WARNING: char not recognized: "+yytext()
                 + " (row " + (yyline+1) + " column " + (yycolumn+1)+")"); 
                return symbol(sym.error); }
