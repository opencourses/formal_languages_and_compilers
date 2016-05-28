%%

%standalone
%class Ex1

nl              = \n|\r|\t
PathFileName    = ({Drive}:)?(\\)?({PathName}\\)*{FileName}(\.{FileType})?\n
Drive           = {letter}
PathName        = {Id}
FileName        = {Id}
FileType        = {Id}
Id              = ({letter}|{digit})+


letter          = [^\\\/\:\*\?\"\<\>0-9\|\n\r\t]
digit           = [0-9]


%%

{PathFileName}  {System.out.println("PathFileName found: \t\t"+ yytext());}
{nl}|" "        {;}

.*               {System.out.println("Error, expression not recognized:\t\t"+yytext());}
