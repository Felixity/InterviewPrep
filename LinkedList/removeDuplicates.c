//
//  main.c
//  removeDuplicates
//
//  Created by Laura on 7/20/17.
//  Copyright © 2017 Laura. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

// Definition for singly-linked list.
struct ListNode {
    int val;
    struct ListNode *next;
};

typedef struct ListNode listnode;

listnode* listnode_new(int val) {
    
    listnode* node = (listnode *) malloc(sizeof(listnode));
    node->val = val;
    node->next = NULL;
    
    return node;
}


void printList(listnode* A) {
    while (A != NULL) {
        printf("%d ->", A->val);
        A = A->next;
    }
    printf("NULL\n");
}

listnode* deleteDuplicates(listnode* A) {

    if (A == NULL) {
        return NULL;
    }
    
    listnode* currentNode = A;
    listnode* q = currentNode;
    
    while(currentNode->next != NULL) {
        q = currentNode;
        while (currentNode->next != NULL && currentNode->val == currentNode->next->val) {
            // skip the elements
            currentNode = currentNode->next;
        }
    
        // create a new link
        q->next = currentNode->next;
        if (currentNode->next != NULL)
        {
            currentNode = currentNode->next;
        }
    }
    
    return A;
}


int main(int argc, const char * argv[]) {
    
    listnode* A;
    
    listnode* node1 = listnode_new(1);
    A = node1;
    
    listnode* node2 = listnode_new(1);
    node1->next = node2;
    
    listnode* node3 = listnode_new(1);
    node2->next = node3;
    
    listnode* node4 = listnode_new(1);
    node3->next = node4;
    
    listnode* node5 = listnode_new(3);
    node4->next = node5;
    
    listnode* node6 = listnode_new(3);
    node5->next = node6;
    
    printList(A);
    listnode* p = deleteDuplicates(A);
    printList(p);
    
    
    return 0;
}
