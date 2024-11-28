%{
#include <stdio.h>
// Initialize variables to keep track of word count and total size
int word_count = 0;
int char_count = 0;
%}

%%
// Match one or more alphabetic characters (words)
[a-zA-Z]+ {
    // Increment the word count
    word_count++;
    // Add the length of the word to the total size
    char_count += yyleng;
}
// Match any single character (including whitespace and newline)
.|\n {
    // Increment the total size
    char_count++;
}
%%

// yywrap function is called at the end of the input file
int yywrap() {
    // Print the final counts
    printf("Number of words: %d\n", word_count);
    printf("Total size of the text: %d\n", char_count);
    return 1;
}

int main() {
    // Call the lexer
    yylex();
    return 0;
}