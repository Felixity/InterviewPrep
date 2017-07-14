//
//  main.c
//  plusOne
//
//  Created by Laura on 7/13/17.
//  Copyright © 2017 Laura. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int countLeadingZero(int* A, int n1) {
    int i, counter = 0;
    
    for (i = 0; i < n1; i++) {
        if (A[i] == 0) {
            counter++;
        }
        else {
            break;
        }
    }
    return counter;
}


/**
 * @input A : Integer array
 * @input n1 : Integer array's ( A ) length
 *
 * @Output Integer array. You need to malloc memory for result array, and fill result's length in length_of_array
 */
int* plusOne(int* A, int n1, int *length_of_array) {
    
    int *result;
    
    int i, insertFirstElement = 0, leadingZeroCounter = 0;
    
    leadingZeroCounter = countLeadingZero(A, n1);
    
    for (i = n1-1; i >= leadingZeroCounter; i--) {
        if (A[i] < 9) {
            A[i] += 1;
            break;
        }
        else {
            A[i] = 0;
            if (i == leadingZeroCounter) insertFirstElement = 1;
        }
    }
    
    if (insertFirstElement == 1) {
        result = (int *) malloc((n1 + 1) * sizeof(int));
        *length_of_array = n1 +1; // length of result array
        result[0] = 1;
        for (i = leadingZeroCounter; i < n1; i++) {
            result[i+1] = A[i];
        }
    }
    else {
        if (leadingZeroCounter == n1) {
            result = (int *) malloc(sizeof(int));
            *length_of_array = 1; // length of result array
            result[0] = 1;
        }
        else {
            result = (int *) malloc((n1 - leadingZeroCounter) * sizeof(int));
            *length_of_array = n1 - leadingZeroCounter; // length of result array
            for(i = leadingZeroCounter; i < n1; i++) {
                result[i-leadingZeroCounter] = A[i];
            }
        }
    }
    
    return result;
}

int main(int argc, const char * argv[]) {

    int A[] = {0, 3, 7, 6, 4, 0, 5, 5, 5};
    
    int n = 10;
    
    int* result = plusOne(A, 9, &n);
    
    int i;
    
    for (i = 0; i < n; i++)
    {
        printf("%d ", result[i]);
    }
    
    printf("\n");
    return 0;
}
