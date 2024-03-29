#include <stdio.h>
#include <stdlib.h>

/* enum readStates stores all possible states of the program, as
   detailed in the DFA */
enum readStates {normal, strLiteral, strOChar, charLiteral, charOChar,
    sWatch, inComment, fWatch};
enum readStates;

/* handleNormal function takes in an int character c and handles the
   normal state of the program, returns a readStates state according
   to the transition, no change to global vars, outputs to stdout */
enum readStates handleNormal(int c)
{
    enum readStates state;
    state = normal;

    if (c == '"') state = strLiteral;
    if (c == '\'') state = charLiteral;
    if (c == '/') state = sWatch;
    
    if (state != sWatch) putchar(c);
    return state;
}

/* handleStrLit function takes in an int character c and handles
   the string literal state of the program, returns a readStates
   state according to the transition, no change to global vars,
   outputs to stdout */
enum readStates handleStrLit(int c)
{
    enum readStates state;
    state = strLiteral;

    if (c == '\\') state = strOChar;
    if (c == '"') state = normal;
    putchar(c);
    return state;
}

/* handleStrOChar function takes in an int character c and handles
   the case where a forward slash (ordinary char) is read in a
   string, returns a readStates state according to the transition,
   no change to global vars, outputs to stdout */
enum readStates handleStrOChar(int c)
{
    enum readStates state;
    state = strLiteral;
    putchar(c);
    return state;
}

/* handleCharLit function takes in an character c and handles the
   state of character literal, returns a readStates state according
   to the transition, no change to global vars, outputs to
   stdout */
enum readStates handleCharLit(int c)
{
    enum readStates state;
    state = charLiteral;
    if (c == '\\') state = charOChar;
    if (c == '\'') state = normal;
    putchar(c);
    return state;
}

/* handleCharOChar function takes in an int character c and handles
   the state of ordinary character for character literals, returns
   a readStates state according to the transition, no change to
   global vars, outputs to stdout */
enum readStates handleCharOChar(int c)
{
    enum readStates state;
    state = charLiteral;
    putchar(c);
    return state;
}

/* handleSW function takes in an int character c and handles
   the state of star watch, returns a readStates state according
   to the transition, no change to global vars, outputs to
   stdout */
enum readStates handleSW(int c)
{
    enum readStates state;
    state = sWatch;
    if (c == '*') {
        putchar(' ');
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

/* handleInComment function takes in an int character c
   and handles the state of in comment, returns a
   readStates state according to the transition, no
   change to global vars, outputs to stdout */
enum readStates handleInComment(int c)
{
    enum readStates state;
    state = inComment;
    if (c == '*') state = fWatch;
    if (c == '\n') putchar(c);
    return state;
}

/* handleFW function takes in an int character c and handles
   the state of forward slash watch, returns a readStates
   state according to the transition, no change to global
   vars, outputs to stdout */
enum readStates handleFW(int c)
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

/* main function, runs the main decomment script, returns
   EXIT_SUCCESS if there are no unterminated comments and
   EXIT_FAILURE otherwise, no change to global vars, outputs
   to stdout and stderr */
int main(void)
{
    int c;
    int line;
    int err;

    line = 1;

    enum readStates state = normal;

    while ((c = getchar()) != EOF) {
        if (c == '\n') 
        {
            line++;
        }

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
            if (c == '*') err = line;
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
        fprintf(stderr, "Error: line %d: unterminated comment\n", err);
        return EXIT_FAILURE;
    }
    return EXIT_SUCCESS;
}
