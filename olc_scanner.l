%{
    /* Constant Definiton */
    #include <stdio.h>

%}

%option noyywrap

/* Regular Definition */
ws			[ \t]*
zi			[0-9]

/* Definition for converion */
hex 		"hex"
dec 		"dec"
oct 		"oct"
to  		"=>"
conv_id 	{hex}|{dec}|{oct}
conv 		{ws}{conv_id}{ws}{zi}+{ws}{to}{ws}{conv_id}{ws}

/* Definition for math expressions */
plus		'+'
minus		'-'
div			'/'
mult		'*'
open		'('
close		')'
mod			'%'

%%
{conv}		{ printf("Conversion\n"); }
{zi}		{ printf("id"); }
%%

main ()
{
    yylex();
}
