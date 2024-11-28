%{
#include <stdio.h>
%}

%%
// Match the string "abc" with higher priority
abc {
    // Replace "abc" with "ABC"
    printf("ABC");
}
// Match one or more alphabetic characters (words)
[a-zA-Z]+ {
    // Print the word as is
    printf("%s", yytext);
}
// Match any single character (including whitespace and newline)
.|\n {
    // Print the character as is
    printf("%s", yytext);
}
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