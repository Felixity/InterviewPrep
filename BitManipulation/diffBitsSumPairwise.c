//
//  main.c
//  diffBitsSumPairwise
//
//  Created by Laura on 8/9/17.
//  Copyright © 2017 Laura. All rights reserved.
//

#include <stdio.h>

int cntNbOfOne(int A) {
    int count = 0;
    
    while (A > 0) {
        if ( (A & 1) != 0)
            count++;
        A >>= 1;
    }
    
    return count;
}

/**
 * @input A : Integer array
 * @input n1 : Integer array's ( A ) length
 *
 * @Output Integer
 */
int cntBits(int* A, int n1) {
    int i, j, bitSum = 0, xor;
    
    for (i = 0; i < n1; i++) {
        for (j = i+1; j < n1; j++) {
            xor = A[i] ^ A[j];
            bitSum = bitSum + cntNbOfOne(xor);
        }
    }
    
    return bitSum * 2;
}

int main(int argc, const char * argv[]) {
    
    int a[] = {81, 13, 2, 7, 96};
    int n = cntBits(a, 5);
    printf("%d\n", n);
    return 0;
}
