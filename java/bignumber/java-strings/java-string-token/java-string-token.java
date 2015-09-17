import java.io.*;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



public class Solution {
    public static void main(String[] args)
    {
        Scanner scan = new Scanner(System.in);
        String s = scan.nextLine();
        List<String> allMatches = new ArrayList<String>();
        Matcher m = Pattern.compile("[A-Za-z]+").matcher(s);
        while (m.find()) {
            allMatches.add(m.group());
        }
        System.out.println(allMatches.size());
        for (String match : allMatches) {
            System.out.println(match);
        }
    }
}
