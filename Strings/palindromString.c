//
//  main.c
//  palindromString
//
//  Created by Laura on 7/13/17.
//  Copyright © 2017 Laura. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "ctype.h"

int sizeOfString(char* string) {
    
    int size = 0;
    
    while (*string != '\0') {
        size++;
        string++;
    }
    
    return size;
}

char* removeNonAlphanumericCharacters(char* string){
    
    int size = sizeOfString(string);
    char* alphanumericString = (char*) malloc((size + 1) * sizeof(char));
    char* p = string;
    
    char *returnString = alphanumericString;
    
    while(*p != '\0') {
        if (isdigit(*p) || isalpha(*p)) {
            *alphanumericString = *p;
            alphanumericString++;
        }
        p++;
    }
    
    *alphanumericString = '\0';
    
    return returnString;
}

/**
 * @input A : String termination by '\0'
 *
 * @Output Integer
 */
int isPalindrome(char* A) {
    
    int i, returnValue = 1;
    
    A = removeNonAlphanumericCharacters(A);
    int size = sizeOfString(A);
    int n = size/2;
    
    char leftChar, rightChar;
    
    for (i = 0; i < n; i++) {
        
        leftChar = tolower(*(A + i));
        rightChar = tolower(*(A + size - 1 - i));
        
        if (leftChar != rightChar) {
            returnValue = 0;
            break;
        }
    }
    
    return returnValue;
}

int main(int argc, const char * argv[]) {
    
    char* s1 = "amanaplanacanalpanama";
    char* s2 = "A man, a plan, a canal: Panama";
    char* s3 = "race a car";
    
    int a = isPalindrome(s1);
    printf("%d ", a);
    int b = isPalindrome(s2);
    printf("%d ", b);
    int c = isPalindrome(s3);
    printf("%d\n", c);
    
    return 0;
}
