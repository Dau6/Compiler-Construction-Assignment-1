%{
#include <stdio.h>
%}

%%
// Match any of the verbs in the list
is|am|are|were|was|be|being|been|do|does|did|will|would|should|can|could|has|have|had|go[ \t]* {
    // Print the matched verb
    printf("Verb found: %s\n", yytext);
}
// Match any single character (including whitespace and newline)
.|\n { }
%%

// yywrap function is called at the end of the input file
int yywrap() {
    return 1;
}

int main() {
    // Call the lexer
    yylex();
    return 0;
}