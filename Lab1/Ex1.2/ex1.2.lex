%%

%standalone
%class Ex2

nl                  = \n|\r|\t
letter              = [a-z]|[A-Z]
digit               = [0-9]
word                = ({letter}|{digit})+
word_with_escape    = ({letter}|{digit}|{escape})+

url                 = {protocol}({addr}|{ip})({port})?\/{path}({final_path}{anchor})?

protocol            = {word}:\/\/

ip                  = ({ip_elem}\.){3}{ip_elem}
ip_elem             = {digit}{1,3}

addr                = (www.)?({word}\.)+.{tld}
tld                 = com|it|net|{word}

path                = ({word_with_escape}\/)*
final_path          = ({word_with_escape}\.{word_with_escape})

port                = :{digit}{1,5}

anchor              = (#{word_with_escape})?

escape              = \%{hex}{2}
hex                 = ({letter}|{digit})

%%

{url}               {System.out.println("Recognized HTTP url:" + yytext());}
/*{escape}            {System.out.println("Recognized escape char: " +yytext());}
{protocol}          {System.out.println("Recognized scheme: " + yytext());}
{port}              {System.out.println("Recognized port: " + yytext());}
{addr}|{ip}         {System.out.println("Recognized domain: " + yytext());}
{anchor}            {System.out.println("Recognized anchor: " + yytext());}*/

{nl}|" "            {;}

.                   {System.out.println("Error \t\t"+ yytext() +"\n");}
