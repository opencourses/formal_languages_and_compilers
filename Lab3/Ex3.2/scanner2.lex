import java_cup.runtime.*;

%%


%standalone
%class scanner2
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

%xstate xtoken

%%

"int"                   {debug("INT"); }
"double"                {debug("DOUBLE"); }
"char"                  {debug("CHAR"); }
"float"                 {debug("FLOAT"); }

"signed"                {debug("SIGNED"); }
"unsigned"              {debug("UNSIGNED"); }
"register"              {debug("REGISTER"); }
"long"                  {debug("LONG"); }
"short"                 {debug("SHORT"); }
"extern"                {debug("EXTERN"); }
"static"                {debug("STATIC"); }

"("                     {debug("RO"); }
")"                     {debug("RC"); }
"["                     {debug("SO"); }
"]"                     {debug("SC"); }
"{"                     {debug("BO"); }
"}"                     {debug("BC"); }
"+"                     {debug("PLUS"); }
"%"                     {debug("MOD"); }
"-"                     {debug("MINUS"); }
"*"                     {debug("STAR"); }
"/"                     {debug("DIV"); }
"="                     {debug("EQ"); }
">"                     {debug("GT"); }
"<"                     {debug("LT"); }
">="                    {debug("GE"); }
"=>"                    {debug("GE"); }
"<="                    {debug("LE"); }
"=<"                    {debug("LE"); }
"&"                     {debug("AND"); }
"|"                     {debug("OR"); }
"!"                     {debug("NOT"); }
";"                     {debug("S"); }
":"                     {debug("C"); }
","                     {debug("COMMA"); }

"while"                 {debug("WHILE"); }
"do"                    {debug("DO"); }
"for"                   {debug("FOR"); }
"if"                    {debug("IF"); }
"else"                  {debug("ELSE"); }
"switch"                {debug("SWITCH"); }
"case"                  {debug("CASE"); }
"default"               {debug("DEFAULT"); }
"return"                {debug("RETURN"); }

{token}                 {debug("TOKEN"); }
{int_value}             {debug("INT"); }
{double_value}          {debug("DOUBLE"); }
{string    }            {debug("STRING"); }

{space}|{nl}            {;}
"/*" ~ "*/"             {;}
"//".*{nl}              {;}
.                       {System.out.println("Error, not recognized char: "+yytext());}
