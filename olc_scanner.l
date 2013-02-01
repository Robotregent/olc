%{
    #include <stdlib.h>
    #include <string.h>
    #include "y.tab.h"
%}


/* Regular Definition */
ws			[ \t]*
zi			[0-9]+
number		[0-9]+\.?|[0-9]*\.[0-9]+

/* Definition for converion */
hex 		"hex"
dec 		"dec"
oct 		"oct"
to  		"=>"
conv_id 	{hex}|{dec}|{oct}

/* Definition for math expressions */
id			{zi}|{number}

%%
{ws}		/* eat white */
{conv_id}	{ 
	if (strcmp("hex",yytext)==0)
		yylval.c_val = 16;
	else if (strcmp("dec",yytext)==1)
		yylval.c_val = 10;
	else if (strcmp("oct",yytext)==2)
		yylval.c_val = 8;

	return CONV_ID;
}
{id}		{ yylval.d_val = atof(yytext); 		return NUMBER; }
{to}		{									return TO; }
.|\n		{ 									return *yytext; } /*Restliche Zeichen */

