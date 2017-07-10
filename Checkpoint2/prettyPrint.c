//
//  main.c
//  Checkpoint2
//
//  Created by Laura on 7/4/17.
//  Copyright © 2017 Laura. All rights reserved.
//


/* Print concentric rectangular pattern in a 2d matrix.
 Let us show you some examples to clarify what we mean.
 
 Example 1:
 
 Input: A = 4.
 Output:
 
 4 4 4 4 4 4 4
 4 3 3 3 3 3 4
 4 3 2 2 2 3 4
 4 3 2 1 2 3 4
 4 3 2 2 2 3 4
 4 3 3 3 3 3 4
 4 4 4 4 4 4 4 
 
 Solution:

 Strep 1:           Step 2:            Step 3:             Step 4:             Step 5:             Step 6:             Step 7:             Step 8:
 
 0 0 0 0 0 0 0      4 0 0 0 0 0 4      4 4 4 4 4 4 4       4 4 4 4 4 4 4       4 4 4 4 4 4 4       4 4 4 4 4 4 4       4 4 4 4 4 4 4       4 4 4 4 4 4 4
 0 0 0 0 0 0 0      4 0 0 0 0 0 4      4 0 0 0 0 0 4       4 3 0 0 0 3 4       4 3 3 3 3 3 4       4 3 3 3 3 3 4       4 3 3 3 3 3 4       4 3 3 3 3 3 4
 0 0 0 0 0 0 0      4 0 0 0 0 0 4      4 0 0 0 0 0 4       4 3 0 0 0 3 4       4 3 0 0 0 3 4       4 3 2 0 2 3 4       4 3 2 2 2 3 4       4 3 2 2 2 3 4
 0 0 0 0 0 0 0      4 0 0 0 0 0 4      4 0 0 0 0 0 4       4 3 0 0 0 3 4       4 3 0 0 0 3 4       4 3 2 0 2 3 4       4 3 2 0 2 3 4       4 3 2 1 2 3 4
 0 0 0 0 0 0 0      4 0 0 0 0 0 4      4 0 0 0 0 0 4       4 3 0 0 0 3 4       4 3 0 0 0 3 4       4 3 2 0 2 3 4       4 3 2 2 2 3 4       4 3 2 2 2 3 4
 0 0 0 0 0 0 0      4 0 0 0 0 0 4      4 0 0 0 0 0 4       4 3 0 0 0 3 4       4 3 3 3 3 3 4       4 3 3 3 3 3 4       4 3 3 3 3 3 4       4 3 3 3 3 3 4
 0 0 0 0 0 0 0      4 0 0 0 0 0 4      4 4 4 4 4 4 4       4 4 4 4 4 4 4       4 4 4 4 4 4 4       4 4 4 4 4 4 4       4 4 4 4 4 4 4       4 4 4 4 4 4 4
 
 =>
 
 for (i = 0, i < size; i ++) && (j = 0 || j = size - 1) -> print (n)
 for (j = 0, j < size; j ++) && (i = 0 || i = size - 1) -> print (n)
 
 for (i = 1, i < size-1; i ++) && (j = 1 || j = size - 2) -> print (n-1)
 for (j = 1, j < size-1; j ++) && (i = 1 || i = size - 2) -> print (n-1)

 for (i = x, i < size-x; i ++) && (j = x || j = size - 1 - x) -> print (n-x) , where x < n - 1
 for (j = x, j < size-x; j ++) && (i = x || i = size - 1 - x) -> print (n-x)

 */

#include <stdio.h>
#include <stdlib.h>


void printMatrixNxN(int size, int** matrix) {
    
    int i,j;
    
    for (i = 0; i < size ; i++) {
        for (j = 0; j < size; j++) {
            printf("%d ",matrix[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

int **prettyPrint(int A, int *number_of_rows, int *number_of_columns) {
    
    int i, j, x = 0;
    *number_of_rows = 2 * A - 1;
    *number_of_columns = 2 * A -1;
    
    int **result = (int **)malloc(*number_of_rows * sizeof(int *));
    
    for (i = 0; i < *number_of_rows; i++) {
        result[i] = (int *)malloc(*number_of_columns * sizeof(int));
    }
    
    while (A > 0) {
        for (i = x; i < *number_of_rows - x; i++) {
            result[i][x] = A;
            result[i][*number_of_rows - 1 - x] = A;
        }
        
        for (j = x; j < *number_of_columns - x; j++) {
            result[x][j] = A;
            result[*number_of_columns - 1 - x][j] = A;
        }
        x = x + 1;
        A = A - 1;
    }
    
    return result;
}

int main(int argc, const char * argv[]) {
    
    int n = 4;
    int size = 2 * n - 1;
    
    int** result = prettyPrint(n, &size, &size);
    printMatrixNxN(size, result);
    
    return 0;
}
