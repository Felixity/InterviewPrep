//Implement atoi to convert a string to an integer.
//
//Example :
//
//Input : "9 2704"
//Output : 9
//Note: There might be multiple corner cases here. Clarify all your doubts using “See Expected Output”.
//
//Questions: Q1. Does string contain whitespace characters before the number?
//A. Yes Q2. Can the string have garbage characters after the number?
//A. Yes. Ignore it. Q3. If no numeric character is found before encountering garbage characters, what should I do?
//A. Return 0. Q4. What if the integer overflows?
//A. Return INT_MAX if the number is positive, INT_MIN otherwise.
//Warning : DO NOT USE LIBRARY FUNCTION FOR ATOI.
//If you do, we will disqualify your submission retroactively and give you penalty points.


#include<stdio.h>
#include<stdlib.h>
#include <limits.h>

int matoi(const char* A) {
    int value = 0;
    long double bigValue=0;
    char* digits = malloc(20);
    sscanf(A, " %[-+0-9]", digits);

    printf("Digits: %s\n", digits);
    sscanf(digits, " %Lf ", &bigValue);
    printf("Big Value: %Lf\n", bigValue);

    if (bigValue > INT_MAX) {
        value = INT_MAX;
    }
    else if (bigValue < INT_MIN) {
        value = INT_MIN;
    }
    else {
        value = bigValue;
    }

    return value;
}


int main() {

    char* str = "+7";
    int value = matoi(str);

    printf("Value: %d\n", value);
    return 0;
}
