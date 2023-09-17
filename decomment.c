#include <stdio.h>
#include <stdlib.h>
enum readStates {normal, strLiteral, strOChar, charLiteral, charOChar, sWatch, inComment, fWatch};
enum readStates;
int line;
int err;
counter = 1;

handleNormal(int c) 
{
    enum readStates state;
    state = normal;

    if (c == '"') state = strLiteral;
    if (c == '\'') state = charLiteral;
    if (c == '/') state = sWatch;
    
    if (state != sWatch) putchar(c);
    return state;
}

handleStrLit(int c)
{
    enum readStates state;
    state = strLiteral;

    if (c == '\\') state = strOChar;
    if (c == '"') state = normal;
    putchar(c);
    return state;
}

handleStrOChar(int c)
{
    enum readStates state;
    state = strLiteral;
    putchar(c);
    return state;
}

handleCharLit(int c)
{
    enum readStates state;
    state = charLiteral;
    if (c == '\\') state = charOChar;
    if (c == '\'') state = normal;
    putchar(c);
    return state;
}

handleCharOChar(int c)
{
    enum readStates state;
    state = charLiteral;
    putchar(c);
    return state;
}

handleSW(int c)
{
    enum readStates state;
    state = sWatch;
    if (c == '*') {
        putchar(' ');
        err = line;
        state = inComment;
        return state;
    }
    if (c == '"') 
    {
        state = strLiteral;
        putchar('/');
        putchar(c);
        return state;
    }
    if (c == '\'') 
    {
        state = charLiteral;
        putchar('/');
        putchar(c);
        return state;
    }
    if (c != '/') 
    {
        state = normal;
        putchar('/');
        putchar(c);
        return state;
    }
    putchar('/');
    return state;
}

handleInComment(int c)
{
    enum readStates state;
    state = inComment;
    if (c == '*') state = fWatch;
    if (c == '\n') putchar(c);
    return state;
}

handleFW(int c)
{
    enum readStates state;
    state = fWatch;
    if (c == '/') 
    {
        state = normal;
        return state;
    }
    if (c == '\n') putchar(c);
    if (c != '*') 
    {
        state = inComment;
        return state;
    }
    return state;
}

int main(void)
{
    int c;
    enum readStates state = normal;

    while ((c = getchar()) != EOF) {
        if (c == '\n') line++;

        switch(state) {
            case normal : 
            state = handleNormal(c);
            break;

            case strLiteral :
            state = handleStrLit(c);
            break;

            case strOChar :
            state = handleStrOChar(c);
            break;

            case charLiteral :
            state = handleCharLit(c);
            break;

            case charOChar :
            state = handleCharOChar(c);
            break;

            case sWatch :
            state = handleSW(c);
            break;

            case inComment :
            state = handleInComment(c);
            break;

            case fWatch :
            state = handleFW(c);
            break;
        }
    }

    if (state == sWatch) putchar('/');

    if (state == inComment || state == fWatch) 
    {
        fprintf(stderr, "Error: line %d: unterminated comment", err);
        return EXIT_FAILURE;
    }
    return EXIT_SUCCESS;
}