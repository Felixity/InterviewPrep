//
//  main.c
//  numberOf1Bits
//
//  Created by Laura on 8/3/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 
 Write a function that takes an unsigned integer and returns the number of 1 bits it has.
 
 Example:
 
 The 32-bit integer 11 has binary representation
 
 00000000000000000000000000001011
 so the function should return 3.
 
 Note that since Java does not have unsigned int, use long for Java
 
 */

#include <stdio.h>

int numSetBits(unsigned int A) {
    int i, count = 0;
    
    for (i = 0; i < 32; i++){
        if ((A & (1 << i)) == (1 << i)) {
            count ++;
        }
    }
    return count;
}

int main(int argc, const char * argv[]) {
    
    int a = numSetBits(3);
    printf("%d\n", a);
    return 0;
}
