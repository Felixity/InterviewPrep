//
//  main.c
//  NextGreater
//
//  Created by Laura on 7/8/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 Given an array, find the next greater element G[i] for every element A[i] in the array. The Next greater Element for an element A[i] is the first greater element on the right side of A[i] in array.
 More formally,
 
 G[i] for an element A[i] = an element A[j] such that
 j is minimum possible AND
 j > i AND
 A[j] > A[i]
 Elements for which no greater element exist, consider next greater element as -1.
 
 Example:
 
 Input : A : [4, 5, 2, 10]
 Output : [5, 10, 10, -1]
 
 Example 2:
 
 Input : A : [3, 2, 1]
 Output : [-1, -1, -1]
 
 Solution:
 
 Step 1:                        Step 2:                         Step 3:                         Step 4:
 
 A:      [4, 5, 2, 10]          A :     [4, 5, 2, 10]           A :     [4, 5, 2,  10]          A :     [4, 5, 2,  10]
 Output: [ ,  ,  ,   ]          Output: [5,  ,  ,   ]           Output: [5, 10, 10,  ]          Output: [5, 10, 10,-1]
 
 s: a[0]                        s: a[1]                         s: a[1], a[2]                   s: a[3]
 index = 1                      index = 2                       index = 3                       index = 4
 s.top < a[1] => s.pop(a[0])    s.top > a[2] => s.push(a[2])    s.top < a[3] => s.pop(a[2])     s.pop(top) until s.isEmpty
 s.push(a[1])                                                   s.top < a[3] => s.pop(a[1])
                                                                s.push(a[3])
 
 */


#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* next;
};

typedef struct Node node;

node* top = NULL;

void push(int x) {
    node* temp = (node *) malloc(sizeof(node));
    temp->data = x;
    temp->next = top;
    top = temp;
}

void pop() {
    node *temp;
    if (top == NULL) return;
    temp = top;
    top = top->next;
    free(temp);
}

/**
 * @input A : Integer array
 * @input n1 : Integer array's ( A ) length
 *
 * @Output Integer array. You need to malloc memory, and fill the length in len1
 */

int* nextGreater(int* A, int n1, int *len1) {
    
    len1 = (int *) malloc(n1 * sizeof(int));

    int index, nextIndex;
    
    index = 0;
    nextIndex = index + 1;
    
    push(index);
    
    for(; index < n1 - 1; index++) {
        // add index to the stack
        
        while ((top != NULL) && (A[top->data] < A[nextIndex])) {
            len1[top->data] = A[nextIndex];
            pop();
        }
            
        push(nextIndex);
        
        nextIndex = nextIndex + 1;
        
        
    }
    
    while (top != NULL) {
        len1[top->data] = -1;
        pop();
    }
    
    for (index = 0; index < n1; index++) {
        printf("%d ", len1[index]);
    }
    printf("\n");
    
    return len1;
}


int main(int argc, const char * argv[]) {
    
    //int A[] = {4, 5, 2, 10};
    //int A[] = {7, 9, 5, 8, 4, 10, 2, 16, 3};
    
    int A[] = { 34, 35, 27, 42, 5, 28, 39, 20, 28 };
    
//    int A[] = {7, 9, 5, 8, 10};
    int *Output;
    
    Output = nextGreater(A, 9, Output);
    
    return 0;
}
