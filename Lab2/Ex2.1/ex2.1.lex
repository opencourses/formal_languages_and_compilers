%%

%standalone
%class ex1_2

nl              = \n|\r|\n\r
letter          = ([A-Z]|[a-z])
word            = {letter}+
number          = ([0-9])
numbers         = {number}+
sign            = (\+|\-)

commentLine     = \/\/.*{nl}
commentStart    = \/\*
commentEnd      = \*\/

type            = "double"|"int"
keyword         = "if"|"else"|"while"|"print"

integer         = {sign}?{numbers}
double          = {sign}?{numbers}\.{numbers}

id              = {word}
%{
    public void print(String str) {
        System.out.print(str+" ");
    }
    public void println(String str) {
        System.out.println(str);
    }
%}

%xstate comment

%%
{type}                  {print(yytext().toUpperCase()+"_TYPE");}       
{integer}               {print("INT:"+yytext());}
{double}                {print("DOUBLE:"+yytext());}
{keyword}               {print(yytext().toUpperCase());}


"["                     {print("SO");}
"]"                     {print("SC");}
"("                     {print("RO");}
")"                     {print("RC");}
"{"                     {print("BO");}
"}"                     {print("BC");}
";"                     {print("S");}
","                     {print(",");}
"="                     {print("EQ");}
"<"                     {print("MIN");}
">"                     {print("MAJ");}

{id}                    {print("ID:"+yytext());}

{commentLine}           {;}
{commentStart}          {yybegin(comment);}
<comment>.              {;}
<comment>{commentEnd}   {yybegin(YYINITIAL);}
" "|"\t"                {;}
{nl}                    {;}
.                       {println("Error, unrecongnized char:"+yytext());}
