lexer grammar JanderLexico;

ALGORITMO : 'algoritmo';
FIM_ALGORITMO : 'fim_algoritmo';
DECLARE : 'declare';
LITERAL : 'literal';
INTEIRO : 'inteiro';
LEIA : 'leia';
ESCREVA : 'escreva';
REAL : 'real';
LOGICO : 'logico';
SE : 'se';
ENTAO: 'entao';
SENAO : 'senao';
FIM_SE : 'fim_se';
CASO : 'caso';
SEJA : 'seja';
FIM_CASO : 'fim_caso';
PARA : 'para';
ATE : 'ate';
FACA : 'faca';
FIM_PARA : 'fim_para';
ENQUANTO : 'enquanto';
FIM_ENQUANTO : 'fim_enquanto';
REGISTRO : 'registro';
FIM_REGISTRO : 'fim_registro';
TIPO : 'tipo';
PROCEDIMENTO : 'procedimento';
FIM_PROCEDIMENTO : 'fim_procedimento';
VAR : 'var';
FUNCAO : 'funcao';
FIM_FUNCAO : 'fim_funcao';
RETORNE : 'retorne';
CONSTANTE : 'constante';
VERDADEIRO : 'verdadeiro';
FALSO : 'falso';

OP_REL	:	'>' | '>=' | '<' | '<=' | '<>' | '='
	;
OP_ARIT	:	'+' | '-' | '*' | '/' | '%'
	;
OP_LOGICO: 	'e' | 'ou' | 'nao'
	;

fragment
DIGITO: '0'..'9';

NUM_INT:
    DIGITO+;

NUM_REAL:
    DIGITO+ '.' DIGITO+;

IDENT:
    ('a'..'z'|'A'..'Z'|'_')('a'..'z'|'A'..'Z'|'0'..'9'|'_')*;

PONTUACAO: ',' | '..' | '<-' | '^' | '&' | '.'
	;

CADEIA:
    '"' (ESC_SEQ | ~('\n'|'\''|'\\'|'"'))* '"';

COMENTARIO:
    '{' ~('}'|'\n')* '}' { skip(); };

COMENTARIO_NAO_FECHADO:
    '{' ~('}'|'\n')* '\n';

CADEIA_NAO_FECHADA: '"' ( ESC_SEQ | ~('\n'|'\''|'\\'|'"') )* '\n'
	;

fragment
ESC_SEQ:
    '\\\'';

WS: (' '|'\t'|'\r'|'\n') { skip(); };

DELIM	:	':'
	;
ABREPAR :	'('
	;
FECHAPAR:	')'
	;
ABREBRACKET:  '['
    ;
FECHABRACKET: ']'
    ;
ERRO: .;