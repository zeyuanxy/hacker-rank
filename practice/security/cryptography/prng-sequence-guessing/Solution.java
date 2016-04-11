import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) {
        Scanner stdin = new Scanner(System.in);
        int T = stdin.nextInt();
        for (int i = 0; i < T; ++i) {
            int start = stdin.nextInt();
            int end = stdin.nextInt();
            int[] values = new int[10];
            for (int j = 0; j < 10; ++j) {
                values[j] = stdin.nextInt();
            }
            for (int seed = start; seed <= end; ++seed) {
                Random rand = new Random(seed);
                boolean flag = true;
                for (int j = 0; j < 10; ++j) {
                    if (rand.nextInt(1000) != values[j]) {
                        flag = false;
                        break;
                    }
                }
                if (flag) {
                    System.out.print(seed + " ");
                    for (int j = 0; j < 10; ++j) {
                        System.out.print(rand.nextInt(1000) + " ");
                    }
                    System.out.println();
                    break;
                }
            }
        }
    }
}