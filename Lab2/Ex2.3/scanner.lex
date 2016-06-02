import java.io.*;
%%

%standalone
%class scanner
%caseless

nl          = (\n|\r|\n\r)
char        = ([a-zA-Z])
number      = ([0-9])
word        = {char}+
alphanum    = ({number}|{char})

minor       = (<|&lt)
major       = (>|&gt)
tag         = {char}{alphanum}*

comm_open   = "<!--"
comm_close  = "-->"

%xstate comment
%xstate tags
%xstate tags_suffix

%{
    FileWriter out;
    int numTags = 0, numTable = 0, numH1 = 0, numH2 = 0, numH3 = 0, numH4 = 0;

    private void print(String str){
		try {
        out.write(str);
		} catch(IOException e) {
			e.printStackTrace();
		}
    }
    private static final boolean DEBUG = false;
    private void debug(String str){
        if (DEBUG)
            System.out.println(str);
    }
    
%}

%init{
	try{
        out = new FileWriter(new File("output.html"));
    } catch(IOException e){
        System.err.println(e);
    }
%init}

%eofthrow IOException
%eof{
	numTags=numTags+numTable+numH1+numH2+numH3+numH4;
    print("\nTotal number of tags: "+numTags+"\n");
    print("Total number of table tags: "+numTable+"\n");
    print("Total number of h1 tags: "+numH1+"\n");
    print("Total number of h2 tags: "+numH2+"\n");
    print("Total number of h3 tags: "+numH3+"\n");
    print("Total number of h4 tags: "+numH4+"\n");
	out.close();
%eof}

%%

{minor}                 {print(yytext()); yybegin(tags);}
<tags>(\/)?table        {print(yytext()); numTable++; yybegin(tags_suffix); 
						 debug("tag: "+yytext());}
<tags>(\/)?H1           {print(yytext()); numH1++; yybegin(tags_suffix); 
						 debug("tag: "+yytext());}
<tags>(\/)?H2        {print(yytext()); numH2++; yybegin(tags_suffix); 
						 debug("tag: "+yytext());}
<tags>(\/)?H3        {print(yytext()); numH3++; yybegin(tags_suffix); 
						 debug("tag: "+yytext());}
<tags>(\/)?H4        {print(yytext()); numH4++; yybegin(tags_suffix); 
						 debug("tag: "+yytext());}
<tags>(\/)?{tag}        {print(yytext()); numTags++; yybegin(tags_suffix); 
						 debug("tag: "+yytext());}
<tags_suffix>{major}    {print(yytext()); yybegin(YYINITIAL); debug("major");}
<tags_suffix>.          {print(yytext());}

{comm_open}             {yybegin(comment);}
<comment>{comm_close}   {yybegin(YYINITIAL);}
<comment>.              {;}

{nl}|" "				{print(yytext());}
.                       {print(yytext());}
