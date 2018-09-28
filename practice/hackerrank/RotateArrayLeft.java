import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {
    public static void shiftleft(int n, int k, int[] array){
        k = k%n;
        int temp[] = new int[n];
        for(int i=0; i<n; i++){
            System.out.print(array[(k+i)%n]+" ");
        }
        
    }