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
    private void debug(String token, String value) {
        System.out.println(token+": "+value);
    }
	private Symbol symbol(int type) {
		return new Symbol(type, yyline, yycolumn);
	}
  	private Symbol symbol(int type, Object value) {
    	return new Symbol(type, yyline, yycolumn, value);
  	}

%}


%%

"int"                   {debug("INT_TYPE",yytext()); return symbol(sym.INT_TYPE);}
"double"                {debug("DOUBLE_TYPE",yytext()); return symbol(sym.DOUBLE_TYPE);}
"char"                  {debug("CHAR_TYPE",yytext()); return symbol(sym.CHAR_TYPE);}
"float"                 {debug("FLOAT_TYPE",yytext()); return symbol(sym.FLOAT_TYPE);}

"signed"                {debug("SIGNED",yytext()); return symbol(sym.SIGNED);}
"unsigned"              {debug("UNSIGNED",yytext()); return symbol(sym.UNSIGNED);}
"register"              {debug("REGISTER",yytext()); return symbol(sym.REGISTER);}
"long"                  {debug("LONG",yytext()); return symbol(sym.LONG);}
"short"                 {debug("SHORT",yytext()); return symbol(sym.SHORT);}
"extern"                {debug("EXTERN",yytext()); return symbol(sym.EXTERN);}
"static"                {debug("STATIC",yytext()); return symbol(sym.STATIC);}

"break"                 {debug("BREAK",yytext()); return symbol(sym.BREAK);}
"continue"              {debug("CONTINUE",yytext()); return symbol(sym.CONTINUE);}

"("                     {debug("RO",yytext()); return symbol(sym.RO);}
")"                     {debug("RC",yytext()); return symbol(sym.RC);}
"["                     {debug("SO",yytext()); return symbol(sym.SO);}
"]"                     {debug("SC",yytext()); return symbol(sym.SC);}
"{"                     {debug("BO",yytext()); return symbol(sym.BO);}
"}"                     {debug("BC",yytext()); return symbol(sym.BC);}
"+"                     {debug("PLUS",yytext()); return symbol(sym.PLUS);}
"%"                     {debug("MOD",yytext()); return symbol(sym.MOD);}
"-"                     {debug("MINUS",yytext()); return symbol(sym.MINUS);}
"*"                     {debug("STAR",yytext()); return symbol(sym.STAR);}
"/"                     {debug("DIV",yytext()); return symbol(sym.DIV);}
"="                     {debug("EQ",yytext()); return symbol(sym.EQ);}
">"                     {debug("GT",yytext()); return symbol(sym.GT);}
"<"                     {debug("LT",yytext()); return symbol(sym.LT);}
">="                    {debug("GE",yytext()); return symbol(sym.GE);}
"=>"                    {debug("GE",yytext()); return symbol(sym.GE);}
"<="                    {debug("LE",yytext()); return symbol(sym.LE);}
"=<"                    {debug("LE",yytext()); return symbol(sym.LE);}
"&"                     {debug("AND",yytext()); return symbol(sym.AND);}
"|"                     {debug("OR",yytext()); return symbol(sym.OR);}
"!"                     {debug("NOT",yytext()); return symbol(sym.NOT);}
";"                     {debug("S",yytext()); return symbol(sym.S);}
":"                     {debug("C",yytext()); return symbol(sym.C);}
","                     {debug("COMMA",yytext()); return symbol(sym.COMMA);}

"while"                 {debug("WHILE",yytext()); return symbol(sym.WHILE);}
"do"                    {debug("DO",yytext()); return symbol(sym.DO);}
"for"                   {debug("FOR",yytext()); return symbol(sym.FOR);}
"if"                    {debug("IF",yytext()); return symbol(sym.IF);}
"else"                  {debug("ELSE",yytext()); return symbol(sym.ELSE);}
"switch"                {debug("SWITCH",yytext()); return symbol(sym.SWITCH);}
"case"                  {debug("CASE",yytext()); return symbol(sym.CASE);}
"default"               {debug("DEFAULT",yytext()); return symbol(sym.DEFAULT);}
"return"                {debug("RETURN",yytext()); return symbol(sym.RETURN);}

{token}                 {debug("TOKEN",yytext()); return symbol(sym.TOKEN);}
{int_value}             {debug("INT",yytext()); return symbol(sym.INT);}
{double_value}          {debug("DOUBLE",yytext()); return symbol(sym.DOUBLE);}
{string}                {debug("STRING",yytext()); return symbol(sym.STRING);}

{space}|{nl}            {;}
"/*" ~ "*/"             {;}
"//".*{nl}              {;}
.                       {System.out.println("Error, not recognized char: "+yytext());}
