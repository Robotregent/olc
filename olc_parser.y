%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>
	#include <math.h>

	void yyerror(const char *str)
	{
		fprintf(stderr,"error: %s\n",str);
	}

	int yywrap()
	{
		return 1;
	}

	int main()
	{
		return yyparse();
	}
	
%}

/* Tokens und die Präzedenzen der Operatoren. */
%{
	enum con_enum {hex, dec, oct};
%}

%union
{
	int			c_val;
	double 		d_val;
}

%token <d_val> NUMBER
%token <c_val> CONV_ID
%token TO

%type <d_val> expr
%type <d_val> term
%type <d_val> faktor
%type <c_val> converter

%{
	double convert(int from,int to, int number){
		return 1.0;
	}
%}

%%

/* Die Produktionen der Grammatik mit ihren semantischen Aktionen. */

start:	
	'\n'		{ printf("\n"); }
	| expr '\n'	{ printf("%f\n", $1); exit(1); }
;

expr:
	expr '+' term					{$$ = $1 + $3; }
|	expr '-' term					{$$ = $1 - $3; }
|	term							{$$ = $1; }
|	converter NUMBER TO converter	{$$ = convert($1, $4, $2); }
;

converter:
	CONV_ID							{$$ = $1; }
;

term:
	term '*' faktor					{$$ = $1 * $3; }
|	term '/' faktor					{$$ = $3 != 0 ? ($1 / $3 ): 0; }
| 	term '^' faktor					{$$ = pow($1,$3); }
|	faktor							{$$ = $1; }
;

faktor:
	NUMBER							{$$ = $1; }
|	'(' expr ')'					{$$ = $2; }
;


%%

