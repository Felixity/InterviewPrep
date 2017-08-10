//
//  main.c
//  minXorValue
//
//  Created by Laura on 8/9/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 
 Given an array of N integers, find the pair of integers in the array which have minimum XOR value. Report the minimum XOR value.
 
 Examples :
 Input
 0 2 5 7
 Output
 2 (0 XOR 2)
 Input
 0 4 7 9
 Output
 3 (4 XOR 7)
 
 Constraints:
 2 <= N <= 100 000
 0 <= A[i] <= 1 000 000 000
 
 */

#include <stdio.h>

int findMinXor(int* A, int n1) {
    
    int i,j, xor, min = INT32_MAX;
    
    for (i = 0; i < n1; i++) {
        for (j = i+1; j < n1; j++) {
            xor = A[i] ^ A[j];
            if (xor < min) {
                min = xor;
            }
        }
    }
    
    return min;
}

int main() {
    int a[] = {12, 4, 6, 2};
    findMinXor(a, 4);
    return 0;
}
