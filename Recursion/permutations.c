//
//  main.c
//  Permutations
//
//  Created by Laura on 7/9/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 
 Given a collection of numbers that might contain duplicates, return all possible unique permutations.
 
 Example :
 [1,1,2] have the following unique permutations:
 
 [1,1,2]
 [1,2,1]
 [2,1,1]
 NOTE : No 2 entries in the permutation sequence should be the same.
 Warning : DO NOT USE LIBRARY FUNCTION FOR GENERATING PERMUTATIONS. Example : next_permutations in C++ / itertools.permutations in python.
 If you do, we will disqualify your submission retroactively and give you penalty points.
 
 */


#include <stdio.h>
#include <stdlib.h>

void addElement(int *uniqueElementsArray, int *n2, int *countAppearancesArray, int elem) {
    
    int i, index = -1;

    // Check if the new element is already present in the unique elements array and increment it's number of appearances
    for (i = 0; i < *n2; i++) {
        if (uniqueElementsArray[i] == elem) {
            index = i;
            countAppearancesArray[index]++;
            break;
        }
    }
    
    if (index == -1) {
        // the element does not exist and should be added
        *n2 = *n2 +1;
        uniqueElementsArray[i] = elem;
        countAppearancesArray[i]++;
    }
}

void createIntermediateArrays(int *A, int n1, int *uniqueElementsArray, int *n2, int *countAppearancesArray) {
    
    int i;
    
    // initialize the countAppearances array
    for (i = 0; i < n1; i++) {
        countAppearancesArray[i] = 0;
    }
    
    for (i = 0; i < n1; i++) {
        addElement(uniqueElementsArray, n2, countAppearancesArray, A[i]);
    }
}

void perm(int *uniqueElementsArray, int n1, int *countAppearancesArray, int **result, int *partialResult, int depth, int *currentRow){
    
    int i,j;
    
    if (depth == n1) {
        // Solution found
        
        for (j=0; j<depth; j++) {
            result[*currentRow][j] = partialResult[j];
        }
        *currentRow += 1;
        return;
    }
    
    for (i = 0; i < n1; i++) {
        if (countAppearancesArray[i] == 0) {
            continue;
        }
        
        partialResult[depth] = uniqueElementsArray[i];
        countAppearancesArray[i]--;
        perm(uniqueElementsArray, n1, countAppearancesArray, result, partialResult, depth+1, currentRow);
        countAppearancesArray[i]++;
    }
}

int ** permute(int* A, int n1, int *len1, int *len2) {

    int i, nFact = 1;
    
    // In case all elements of A are distinct the number of solutions is n1!
    for (i = 1; i <= n1; i++) {
        nFact *= i;
    }
    
    // *len1 = result's number of rows
    *len1 = nFact;
    
    // *len2 = result's number of columns
    *len2 = n1;
    
    int **result = (int **) malloc(*len1 * sizeof(int *));
    
    for (i = 0; i < *len1; i++) {
        result[i] = (int *) malloc(*len2 * sizeof(int));
    }

    // Create a array with all unique elements of array A and one with the number of appearances of each element in A
    int *uniqueElementsArray = (int *) malloc(n1 * sizeof(int));
    int *countAppearancesArray = (int *) malloc(n1 * sizeof(int));
    
    // Initialize lenght of uniqueElementsArray and countAppearancesArray to 0
    int *n2 = malloc(sizeof(int));
    *n2 = 0;
    
    createIntermediateArrays(A, n1, uniqueElementsArray, n2, countAppearancesArray);
    
    int *partialResult = (int *) malloc(n1 * sizeof(int));
    int currentRow = 0;
    
    perm(uniqueElementsArray, n1, countAppearancesArray, result, partialResult, 0, &currentRow);
    
    // If the array contains duplicate elements, we must dislpay only distinct solutions. Therefore we have to free some memory..
    for (i = currentRow; i < *len1; i++) {
        free(result[i]);
    }
    
    *len1 = currentRow;
    
    return result;
}

int main(int argc, const char * argv[]) {
    
    int A[]  = {1, 2, 2, 4};
    int n1 = 4;
    
    int *len1 = malloc(sizeof(int));
    int *len2 = malloc(sizeof(int));
    
    int **result = permute(A, n1, len1, len2);
    
    // Print the result matrix
    int i, j;
    
    for (i = 0; i < *len1; i++){
        for (j = 0; j < *len2; j++){
            printf("%d ",result[i][j]);
        }
        printf("\n");
    }
    
    return 0;
}
















