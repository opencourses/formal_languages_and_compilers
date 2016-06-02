import java_cup.runtime.*;
%%

%unicode
%class scanner
%cup

nl          = (\n|\r|\n\r)
letter      = ([A-Za-z ])
number      = ([0-9])
word        = {letter}+
uint        = {number}+

separator   = \%\%
comma       = \,
col         = \:
scol        = \;

name        = \"[A-Za-z0-9 .,:]+\"
hex         = ([A-F0-9])
isbn        = ({number}{2}\-){2}{hex}{5}\-({letter}|{number})

LI          = ("li"|"LI")
LS          = ("ls"|"LS")
AV          = ("av"|"AV")
BO          = ("bo"|"BO")
SO          = ("so"|"SO")

day         = (0[1-9]|[1-2][0-9]|3[0-1])
month       = (0[1-9]|1[0-2])
year        = {number}{4}
date        = {day}\/{month}\/{year}

%{
    private static final boolean DEBUG = true;
    private void println(String str) {
        if (DEBUG) {
            System.out.println(str);
        }
    }
%}

%%

{nl}|" "|\t     {;}

{letter}        {println("LETTER");     return new Symbol(sym.LETTER);}
{uint}          {println("UINT");       return new Symbol(sym.UINT);}

"->"            {println("ARROW");      return new Symbol(sym.ARROW);}
{separator}     {println("SEP");        return new Symbol(sym.SEP);}
{col}           {println("COL");        return new Symbol(sym.COL);}
{scol}          {println("SCOL");       return new Symbol(sym.SCOL);}
{comma}         {println("COMMA");      return new Symbol(sym.COMMA);}

{LI}            {println("LI");         return new Symbol(sym.LI);}
{LS}            {println("LS");         return new Symbol(sym.LS);}
{AV}            {println("AV");         return new Symbol(sym.AV);}
{BO}            {println("BO");         return new Symbol(sym.BO);}
{SO}            {println("SO");         return new Symbol(sym.SO);}

{name}          {println("NAME");       return new Symbol(sym.NAME);}
{isbn}          {println("ISBN");       return new Symbol(sym.ISBN);}

{date}          {println("DATE");       return new Symbol(sym.DATE);}


.               {println("Error, letter not recognized: "+yytext());}
