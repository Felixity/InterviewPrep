//Given an m x n matrix of 0s and 1s, if an element is 0, set its entire row and column to 0.
//
//Do it in place.
//
//Example
//
//Given array A as
//
//1 0 1
//1 1 1
//1 1 1
//On returning, the array A should be :
//
//0 0 0
//1 0 1
//1 0 1
//Note that this will be evaluated on the extra memory used. Try to minimize the space and time complexity.


#include<stdio.h>
#include<stdlib.h>
#include<string.h>

void prettyPrint(int n, int m, int** a) {
    printf("\nMatrix: ");
    for (int i=0; i<n; i++) {
        printf("\n");
        for (int j=0; j<m; j++) {
            printf("%d ", a[i][j]);
        }
    }
    printf("\n");
}


/**
 * @input A : 2D integer array
 * @input n11 : Integer array's ( A ) rows
 * @input n12 : Integer array's ( A ) columns
 *
 * @Output Void. Just modifies the args passed by reference
 */
void setZeroes(int** A, int n11, int n12) {
    
    int n = n11, m = n12;
    int rows[n], columns[m];
    int i, j;

    //reset arrays
    for (j=0; j<m; j++)
        columns[j] = 0;

    for (i=0; i<n; i++) {
        rows[i] = 0;
        for (j=0; j<m; j++) {

            if (A[i][j] == 0)
            {
                rows[i] = 1;
                columns[j] = 1;
            }
        }
    }
    
    for (i=0; i<n; i++) {
        for (j=0; j<m; j++) {
            if ((rows[i] == 1) || (columns[j] == 1)) {
                A[i][j] = 0;
            }
        }
    }
}

int main() {
    int n = 28, m = 40;
    int **matrix;

    matrix = (int **)malloc(n * sizeof(int *));
    
    for (int i=0; i<n; i++) {
        matrix[i] = (int *)malloc(m * sizeof(int));
        for (int j=0; j<m; j++) {
            matrix[i][j] = 1;
        }
    }

    matrix[27][37] = 0;

    prettyPrint(n, m, matrix);

    setZeroes(matrix, n, m);

    prettyPrint(n, m, matrix);

    return 0;
}
