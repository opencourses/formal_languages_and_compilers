import java_cup.runtime.*;

%%

%class scanner
%cup
%unicode
%line
%column

nl              = \n|\r|\n\r
space           = [ \t]
token           = ([a-zA-Z][a-zA-Z0-9_\-]*)
int_value       = ([1-9][0-9]*|0)
double_value    = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?
string          = \"[A-Za-z0-9_\-\*\+\.,;:]*\"


%{
    private void debug(String str){
        System.out.println(str);
    }
	private Symbol symbol(int type) {
		return new Symbol(type, yyline, yycolumn);
	}
  	private Symbol symbol(int type, Object value) {
    	return new Symbol(type, yyline, yycolumn, value);
  	}

%}


%%

"int"                   {debug("INT_TYPE"); return symbol(sym.INT_TYPE);}
"double"                {debug("DOUBLE_TYPE"); return symbol(sym.DOUBLE_TYPE);}
"char"                  {debug("CHAR_TYPE"); return symbol(sym.CHAR_TYPE);}
"float"                 {debug("FLOAT_TYPE"); return symbol(sym.FLOAT_TYPE);}

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
":"                     {debug("C"); return symbol(sym.C);}
","                     {debug("COMMA"); return symbol(sym.COMMA);}

"while"                 {debug("WHILE"); return symbol(sym.WHILE);}
"do"                    {debug("DO"); return symbol(sym.DO);}
"for"                   {debug("FOR"); return symbol(sym.FOR);}
"if"                    {debug("IF"); return symbol(sym.IF);}
"else"                  {debug("ELSE"); return symbol(sym.ELSE);}
"switch"                {debug("SWITCH"); return symbol(sym.SWITCH);}
"case"                  {debug("CASE"); return symbol(sym.CASE);}
"default"               {debug("DEFAULT"); return symbol(sym.DEFAULT);}
"return"                {debug("RETURN"); return symbol(sym.RETURN);}

{token}                 {debug("TOKEN"); return symbol(sym.TOKEN);}
{int_value}             {debug("INT"); return symbol(sym.INT);}
{double_value}          {debug("DOUBLE"); return symbol(sym.DOUBLE);}
{string}                {debug("STRING"); return symbol(sym.STRING);}

{space}|{nl}            {;}
"/*" ~ "*/"             {;}
"//".*{nl}              {;}
.                       {System.out.println("Error, not recognized char: "+yytext());}
