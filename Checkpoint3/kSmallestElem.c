//
//  main.c
//  KthSmallestElem
//
//  Created by Laura on 7/4/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 Find the kth smallest element in an unsorted array of non-negative integers.
 
 Definition of kth smallest element
 
 kth smallest element is the minimum possible n such that there are at least k elements in the array <= n.
 In other words, if the array A was sorted, then A[k - 1] ( k is 1 based, while the arrays are 0 based )
 NOTE
 You are not allowed to modify the array ( The array is read only ).
 Try to do it using constant extra space.
 
 Example:
 
 A : [2 1 4 3 2]
 k : 3
 
 answer : 2
 
 Solution:
 
 Step 1:                            Step 2:                     Step 3:                 Step 4:             Step 5:             Step 6:
 
 A : [2 1 4 3 2]                    A : [2 1 4 3 2]             A : [2 1 4 3 2]         A : [2 1 4 3 2]     A : [2 1 4 3 2]     A : [2 1 4 3 2]
 B : [max_int max_int max_int]      B : [2 max_int max_int]     B : [1 2 max_int]       B : [1 2 4]         B : [1 2 3]         B : [1 2 2]
 
 => Answer: 2
 
 */

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

void initializeArray(int* b, int size) {
    
    int i;
    
    for (i = 0; i < size; i++) {
        b[i] = INT_MAX;
    }
}

int kthsmallest(const int* A, int n1, int k) {
    
    int returnValue;
    int i, j, l, B[k];
    
    initializeArray(B, k);
    
    if (k < 1) {
        returnValue = -1;
    }
    else {
        for (i = 0; i < n1; i++) {
            for (j = 0; j < k; j++) {
                
                if (A[i] < B[j]) {
                    
                    // shift all elements that are greater and equal to b[j] to make room for a[i]
                    for (l = k - 1; l > j; l--) {
                        B[l] = B[l-1];
                    }
                    
                    B[j] = A[i];
                    break;
                }
            }
        }
        returnValue = B[k - 1];
    }
    
    return returnValue;    
}

int main(int argc, const char * argv[]) {
    
    int a[] = {8, 16, 80, 55, 32, 8, 38, 40, 65, 18, 15, 45, 50, 38, 54, 52, 23, 74, 81, 42, 28, 16, 66, 35, 91, 36, 44, 9, 85, 58, 59, 49, 75, 20, 87, 60, 17, 11, 39, 62, 20, 17, 46, 26, 81, 92};
    int k = 9;

    int size = sizeof(a) / sizeof(int);
    
    int smallestElem = kthsmallest(a, size, k);
    printf("%dth smallest element: %d\n", k, smallestElem);
    
    return 0;
}
