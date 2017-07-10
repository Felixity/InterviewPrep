//
//  main.c
//  Numrange
//
//  Created by Laura on 7/9/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/* 
 
 Given an array of non negative integers A, and a range (B, C),
 find the number of continuous subsequences in the array which have sum S in the range [B, C] or B <= S <= C
 
 Continuous subsequence is defined as all the numbers A[i], A[i + 1], .... A[j]
 where 0 <= i <= j < size(A)
 
 Example :
 
 A : [10, 5, 1, 0, 2]
 (B, C) : (6, 8)
 ans = 3
 as [5, 1], [5, 1, 0], [5, 1, 0, 2] are the only 3 continuous subsequence with their sum in the range [6, 8]
 
*/

#include <stdio.h>

/**
 * @input A : Integer array
 * @input n1 : Integer array's ( A ) length
 * @input B : Integer
 * @input C : Integer
 *
 * @Output Integer
 */

int numRange(int* A, int n1, int B, int C) {
    int i = 0, j = 0 , sum = 0, count = 0;
    
    for (i = 0; i < n1; i++) {
        sum = A[i];
        j = i + 1;
        
        while (sum <= C && j <= n1) {
            if (sum >= B) {
                count++;
                printf("#%d. sum: %d\n", count, sum);
            }
            sum += A[j];
            j++;
        }
    }
    
    return count;
}

int main(int argc, const char * argv[]) {

    int a[] = {80, 34, 71, 40, 62, 30, 93, 11, 22, 59, 80, 61, 91, 94, 77, 27, 78, 72, 45, 53, 37};
    
    int n = numRange(a, 21, 34, 612);
    
    printf("n = %d \n", n);
    return 0;
}
