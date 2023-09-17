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
}

handleStrLit(int c)
{
    enum readStates state;
    if (c = "\\") state = strOChar;
    if (c = "\"") state = normal;
}

handleStrOChar(int c)
{
    enum readStates state;
    if (c != "\\") state = strLiteral;
}

handleCharLit(int c)
{
    enum readStates state;
    if (c = "\\") state = charOChar;
    if (c = "'") state = normal;
}

handleCharOChar(int c)
{
    enum readStates state;
    if (c != "\\") state = charLiteral;
}

handleSW(int c)
{
    enum readStates state;
    if (c = "*") state = inComment;
    if (c != "/") state = normal;
}

handleInComment(int c)
{
    enum readStates state;
    if (c = "*") state = fWatch;
}

handleFW(int c)
{
    enum readStates state;
    if (c = "/") state = normal;
    if (c != "*") state = inComment;
}

int main(void)
{
    int c;
    
    enum readStates state = normal;

    while ((c = getchar()) != EOF) {
        switch(state) {
            case normal : 
            handleNormal(c);
            break;

            case strLiteral :
            handleStrLit(c);
            break;

            case strOChar :
            handleStrOChar(c);
            break;

            case charLiteral :
            handleCharLit(c);
            break;

            case charOChar :
            handleCharOChar(c);
            break;

            case sWatch :
            handleSW(c);
            break;

            case inComment :
            handleInComment(c);
            break;

            case fWatch :
            handleFW(c);
            break;
        }
    }

    if (state == inComment || state == fWatch) return EXIT_FAILURE;
    return EXIT_SUCCESS;
}