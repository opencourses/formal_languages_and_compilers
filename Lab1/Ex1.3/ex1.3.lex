%%

%standalone
%class Ex3

nl              = \n|\r|\n\r
letter          = [a-z][A-Z]
number          = [0-9]

preprocessor    = #.*{nl}
type            = ("int"|"float"|"double"|"single"|"char"|"struct")
keywords        = ("typedef"|"if"|"else"|"return"|"for"|"do"|"while"|"switch"|"case"|"break"|"continue"|"goto")
operands        = [\+\-\*\/]
constantNumber  = (({number}+)(\.({number})+)?)
commentLine     = \/\/.*{nl}
commentStart    = \/\*
commentEnd      = \*\/

word            = {letter}+
identifier      = {word}

%init{
    System.out.println("<html>\n<body bgcolor=\"#FFFFFF\">");
    System.out.println("<h2>" + "main.c" + "</h2>");
    System.out.println("<code>");
%init}

%eof{
    System.out.println("</code>\n</body>\n</html>");
%eof}

%{
    public void useFont(String value, String color) {
        System.out.print("<font style='color: #0000FF;'>"+value+"</font>");
    }
    public void useFontNoClose(String value, String color) {
        System.out.print("<font style='color: #0000FF;'>"+value);
    }
    public void useFontNL(String value, String color) {
        System.out.println("<font style='color: #0000FF;'>"+value+"</font>");
    }
%}

%xstate comment

%%
\<                      {System.out.print("&lt;");}
\>                      {System.out.print("&gt;");}
{preprocessor}          {useFontNL(yytext().replace("<", "&lt;").replace(">", "&gt;"), "#009928");}
{type}                  {useFont(yytext(), "#0000FF");}
{keywords}              {useFont(yytext(), "#02c6b9");}
{constantNumber}        {useFont(yytext(), "#FF1100");}
{operands}              {useFont(yytext(), "#000000");}

\t                      {System.out.print("&emsp;&emsp;&emsp;");}
{commentLine}           {useFontNL(yytext(), "#C0C0C0");}
{commentStart}          {useFont(yytext(), "#COCOCO"); yybegin(comment);}
<comment>{commentEnd}   {useFontNoClose(yytext(), "#COCOCO"); yybegin(YYINITIAL);}
<comment>{nl}           {System.out.println("<br />\n");}
<comment>.              {System.out.print(yytext());}

{nl}                    {System.out.println("<br />\n");}

.                       {System.out.print(yytext());}
