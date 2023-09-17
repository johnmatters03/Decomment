#include <stdio.h>
#include <stdlib.h>
enum readStates {normal, strLiteral, strOChar, charLiteral, charOChar, sWatch, inComment, fWatch};
enum readStates

handleNormal(int c) 
{
    enum readStates state;
    if (c = "\"") state = strLiteral;
    if (c = "'") state = charLiteral;
    if (c = "/") state = sWatch;
    return state;
}

handleStrLit(int c)
{
    enum readStates state;
    if (c = "\\") state = strOChar;
    if (c = "\"") state = normal;
    return state;
}

handleStrOChar(int c)
{
    enum readStates state;
    if (c != "\\") state = strLiteral;
    return state;
}

handleCharLit(int c)
{
    enum readStates state;
    if (c = "\\") state = charOChar;
    if (c = "'") state = normal;
    return state;
}

handleCharOChar(int c)
{
    enum readStates state;
    if (c != "\\") state = charLiteral;
    return state;
}

handleSW(int c)
{
    enum readStates state;
    if (c = "*") state = inComment;
    if (c = "\"") state = strLiteral;
    if (c = "'") state = charLiteral;
    if (c != "/") state = normal;
    return state;
}

handleInComment(int c)
{
    enum readStates state;
    if (c = "*") state = fWatch;
    return state;
}

handleFW(int c)
{
    enum readStates state;
    if (c = "/") state = normal;
    if (c != "*") state = inComment;
    return state;
}

int main(void)
{
    int c;
    
    enum readStates state = normal;

    while ((c = getchar()) != EOF) {
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

    if (state == inComment || state == fWatch) 
    {
        putchar('F');
        return EXIT_FAILURE;
    }
    putchar('S');
    return EXIT_SUCCESS;
}