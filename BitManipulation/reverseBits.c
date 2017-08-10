//
//  main.c
//  singleNumber
//
//  Created by Laura on 8/3/17.
//  Copyright © 2017 Laura. All rights reserved.
//

#include <stdio.h>

/*
 
 Reverse bits of an 32 bit unsigned integer
 
 Example 1:
 
 x = 0,
 
 00000000000000000000000000000000
 =>        00000000000000000000000000000000
 return 0
 
 Example 2:
 
 x = 3,
 
 00000000000000000000000000000011
 =>        11000000000000000000000000000000
 return 3221225472
 
 */

unsigned int reverse(unsigned int A) {
    int i, reverseA = 0;
    int bitMask;
    
    for (i = 0; i < 32; i++) {
        bitMask = (A >> i) & 1;
        reverseA = reverseA | (bitMask << (31 - i));
    }
    
    return reverseA;
}

int main(int argc, const char * argv[]) {
    
    int n = 2;
    
    printf("%d\n", reverse(n));
    return 0;
}
