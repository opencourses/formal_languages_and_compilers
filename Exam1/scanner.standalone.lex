import java_cup.runtime.*;
%%

%standalone
%class scanner
%line
%column
%unicode

%{
    private void debug(String str){
        if (true) {
            System.out.println(str);
        }
    }
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}


nl          = \n|\r|\n\r
st          = " "|\t
number      = [0-9]
integer     = ([1-9][0-9]*|0)
integer_two = ([0-9][0-9])
alpha       = [a-zA-Z]
alpha_word  = {alpha}+

token       = "*****"
code        = {code_prefix}{code_suffix}
code_prefix = ((Y|X){3}((Y|X){2})*)?
code_suffix = ((-|\+)?{integer}|0)
time_short  = {hh}:{mm}
time_long   = {hh}:{mm}:{ss}
hh          = {integer_two}
mm          = {integer_two}
ss          = {integer_two}

user        = {user_code}((\.{user_number}){2})+
user_code   = {alpha}{3}({alpha}{2})*
user_number = (1[2-9]|[3-9][0-9]|1[0-2][0-9]|13[0-2])

value       = ({integer}\.{integer_two})
%state header, currencies, auctions
%xstate quote
%init{
    yybegin(header);
%init}
%%


{nl}|{st}   {;}
<header> {
    {code}      {debug("CODE"+yytext()); }
    {time_short} {debug("TIME_SHORT"+yytext()); }
    {time_long} {debug("TIME_LONG"+yytext()); }
    {token}     {debug("CHANGING TO STATE currencies"); 
                 yybegin(currencies);}
} // end header state
<currencies> {
    {value}     {debug("VALUE"); }
    {user}      {debug("USER"+yytext()); }
    {alpha_word} {debug("ALPHA_WORD"); }
    {token}     {debug("CHANGING TO STATE currencies");
                 yybegin(auctions);}
} // end currencies state

<auctions> {
    "Auction"   {debug("AUCTION"); }
    "euro"      {debug("EURO"); }
    {alpha_word} {debug("ALPHA_WORD"); }
    {user}      {debug("USER"+yytext()); }
    {value}     {debug("VALUE"); }
    {integer}   {debug("INTEGER"); }
} // end auctions state
\"          {debug("QUOTE"); yybegin(quote); }
<quote>\"   {debug("QUOTE"); yybegin(auctions); }
<quote>.    {debug("inside quote"+yytext()); }
"->"        {debug("ARROW"); }
";"         {debug("S"); }
":"         {debug("C"); }
"."         {debug("DOT"); }
","         {debug("COMMA"); }
.           {debug("char not recognized "+yytext());}
