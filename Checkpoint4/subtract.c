//
//  main.c
//  SUBTRACT
//
//  Created by Laura on 7/4/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/* Given a singly linked list, modify the value of first half nodes such that :
 
 1st node’s new value = the last node’s value - first node’s current value
 2nd node’s new value = the second last node’s value - 2nd node’s current value,
 and so on …
 
 NOTE :
 * If the length L of linked list is odd, then the first half implies at first floor(L/2) nodes. So, if L = 5, the first half refers to first 2 nodes.
 * If the length L of linked list is even, then the first half implies at first L/2 nodes. So, if L = 4, the first half refers to first 2 nodes.
 Example :
 
 Given linked list 1 -> 2 -> 3 -> 4 -> 5,
 
 You should return 4 -> 2 -> 3 -> 4 -> 5
 as
 
 for first node, 5 - 1 = 4
 for second node, 4 - 2 = 2
 Try to solve the problem using constant extra space.
 
 */

#include <stdio.h>


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

/**
 * @input A : Head pointer of linked list
 *
 * @Output head pointer of list.
 */

listnode* subtract(listnode* A) {
    
    listnode *p, *q;
    int listLength = 0;
    int intermediateLegth = 0;
    int i, j;
    
    p = A;
    
    // determine the size of the list
    while (p != NULL) {
        p = p->next;
        listLength++;
    }
    
    intermediateLegth = listLength;
    
    p = A;
    
    if (listLength % 2 == 0) {
        listLength = listLength / 2;
    }
    else {
        listLength = listLength / 2;
    }
    
    for (i = 0; i < listLength; i++) {
        q = A;
        for ( j = 0; j < intermediateLegth-1; j++) {
            q = q->next;
        }

        p->val = q->val - p->val;
        p = p->next;
        intermediateLegth--;
    }
    
    return A;
}

int main(int argc, const char * argv[]) {
    
    listnode* A;
    
    listnode* node1 = listnode_new(1);
    A = node1;
    
    listnode* node2 = listnode_new(2);
    node1->next = node2;
    
    listnode* node3 = listnode_new(3);
    node2->next = node3;
    
    listnode* node4 = listnode_new(4);
    node3->next = node4;
    
    listnode* node5 = listnode_new(5);
    node4->next = node5;
    
//    listnode* node6 = listnode_new(9);
//    node5->next = node6;
    
    listnode* p = subtract(A);
    printList(p);
    
    return 0;
}
