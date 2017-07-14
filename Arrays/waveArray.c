//
//  main.c
//  waveArray
//
//  Created by Laura on 7/13/17.
//  Copyright © 2017 Laura. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int partition( int a[], int l, int r) {
    int pivot, i, j, t;
    
    pivot = a[l];
    i = l; j = r+1;
    
    while( 1)
    {
        do ++i; while( a[i] <= pivot && i <= r );
        do --j; while( a[j] > pivot );
        if( i >= j ) break;
        t = a[i]; a[i] = a[j]; a[j] = t;
    }
    
    t = a[l]; a[l] = a[j]; a[j] = t;
    return j;
}

void quickSort( int a[], int l, int r)
{
    int j;
    
    if( l < r )
    {
        // divide and conquer
        j = partition( a, l, r);
        quickSort( a, l, j-1);
        quickSort( a, j+1, r);
    }
    
}

/**
 * @input A : Integer array
 * @input n1 : Integer array's ( A ) length
 *
 * @Output Integer array. You need to malloc memory, and fill the length in len1
 */
int* wave(int* A, int n1, int *len1) {
    
    *len1 = n1;
    
    int i, aux;
    
    int* result = (int *) malloc(*len1 * sizeof(int));
    
    // sort A
    quickSort(A, 0, (n1 - 1));
    
    // swap pairs of 2
    for (i = 0; i < n1 - 1; i++) {
        aux = A[i];
        A[i] = A[i + 1];
        A[i + 1] = aux;
        i++;
    }
    
    result = A;
    return result;
}


int main(int argc, const char * argv[]) {

    int A[] = {4, 1, 3, 2, 5};
    
    int n = 5;
    
    int* result = wave(A, 5, &n);
    
    int i;
    
    for (i = 0; i < 5; i++) {
        printf("%d ", result[i]);
    }
    printf("\n");
    
    return 0;
}
