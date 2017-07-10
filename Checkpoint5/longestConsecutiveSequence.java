 import java.util.*;
 import java.io.*;
 public class Solution {

     public int longestConsecutive(final List<Integer> a) {
         HashSet<Integer> hashSet = new HashSet<Integer>();
         int count = 0;

         for (Integer item : a)
             hashSet.add(item);

         for (Integer item : a)
         {
             if (!hashSet.contains(item - 1))
             {
                 int value = item;
                 while (hashSet.contains(value))
                     value++;

                 count = (count < value-item) ? value-item : count;
             }
         }
         return count;
     }

     // Testing program
     public static void main(String args[])
     {
         Integer[] arr =  new Integer[] {1, 9, 3, 10, 4, 20, 2};
         List<Integer> list = new ArrayList<Integer>();
         list.addAll(Arrays.asList(arr));
         Solution sol = new Solution();

         System.out.println("Length of the Longest consecutive subsequence is " +
                            sol.longestConsecutive(list));
     }
 }