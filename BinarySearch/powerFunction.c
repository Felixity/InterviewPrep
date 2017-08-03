//
//  main.c
//  powerFunction
//
//  Created by Laura on 8/2/17.
//  Copyright © 2017 Laura. All rights reserved.
//

/*
 
 Implement pow(x, n) % d.
 
 In other words, given x, n and d,
 
 find (xn % d)
 
 Note that remainders on division cannot be negative.
 In other words, make sure the answer you return is non negative.
 
 Input : x = 2, n = 3, d = 3
 Output : 2
 
 2^3 % 3 = 8 % 3 = 2.
 
 */


#include <stdio.h>

int powmod(int x, int n, int d) {
    int result = 1;
    int square = x;
    
    if (x == 0) {
        return 1;
    }
    
    if (n == 0) {
        return 1;
    }
    
    while (n != 0) {
        
        if(n % 2) {
            result = result * square;
        }
        
        square = (square * square) % d;
        n = n / 2;
        
        if(result > d) {
            result = result % d;
        }
    }
    
    if (x < 0) {
        result = (result + d) % d;
    }
    
    return result;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    
    printf("%d\n", powmod(2,3,3));
    
    return 0;
}
