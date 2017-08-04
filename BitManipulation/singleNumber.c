//
//  main.c
//  singleNumber
//
//  Created by Laura on 8/3/17.
//  Copyright © 2017 Laura. All rights reserved.
//

#include <stdio.h>

/*
 
 Given an array of integers, every element appears twice except for one. Find that single one.
 
 Note: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example :
 
 Input : [1 2 2 3 1]
 Output : 3
 NOTE: You only need to implement the given function. Do not read input, instead use the arguments to the function. Do not print the output, instead return values as specified. Still have a doubt? Checkout Sample Codes for more details.
 
 */

int singleNumber(const int* A, int n1) {
    int i, xor = 0;
    
    for (i = 0; i < n1; i++) {
        xor = xor ^ A[i];
    }
    
    return xor;
}

int main(int argc, const char * argv[]) {
    
    int n[5] = {1, 2, 2, 3, 1};
    
    printf("%d\n", singleNumber(n, 5));
    return 0;
}
