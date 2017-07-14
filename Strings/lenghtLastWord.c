//
//  main.c
//  lenghtLastWord
//
//  Created by Laura on 7/13/17.
//  Copyright © 2017 Laura. All rights reserved.
//

#include <stdio.h>

/**
 * @input A : Read only ( DON'T MODIFY ) String termination by '\0'
 *
 * @Output Integer
 */
int lengthOfLastWord(const char* A) {
    int counter = 0;
    
    while (*A != '\0') {
        if (*A != ' ') {
            counter++;
            A++;
        }
        else {
            if (*(A+1) != '\0' && *(A+1) != ' ') {
                counter = 0;
            }
            A++;
        }
    }
    
    
    return counter;
}

int main(int argc, const char * argv[]) {
    
    char* s = "Hel world";
    
    int n = lengthOfLastWord(s);
    
    printf("%d \n",n);
    
    return 0;
}
