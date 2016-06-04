import java_cup.runtime.*;
import utils;
%%

%standalone
%class scanner
%unicode
%line
%column


nl              = \n|\r|\n\r
lower_letter    = [a-z]
upper_letter    = [A-Z]

%%

{nl}            = {;}
{lower_letter}  = {Utils.debug("LOWER");}


