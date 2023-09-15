#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int c;
    enum readStates {normal, strLiteral, strOChar, charLiteral, charOChar, sWatch, inComment, fWatch};
    enum readStates state;
    state = normal;

    while (c != EOF) {
        c = getchar();
        switch(state) {
            case normal : 
            if (c = "\"") state = strLiteral;
            if (c = "'") state = charLiteral;
            if (c = "/") state = sWatch;
            break;

            case strLiteral :
            if (c = "\\") state = strOChar;
            if (c = "\"") state = normal;
            break;

            case strOChar :
            if (c != "\\") state = strLiteral;
            break;

            case charLiteral :
            if (c = "\\") state = charOChar;
            if (c = "'") state = normal;
            break;

            case charOChar :
            if (c != "\\") state = charLiteral;
            break;

            case sWatch :
            if (c = "*") state = inComment;
            if (c != "/") state = normal;
            break;

            case inComment :
            if (c = "*") state = fWatch;
            break;

            case fWatch :
            if (c = "/") state = normal;
            if (c != "*") state = inComment;
            break;
        }
    }

    if (state == inComment || state == fWatch) return EXIT_FAILURE;
    return EXIT_SUCCESS;
}