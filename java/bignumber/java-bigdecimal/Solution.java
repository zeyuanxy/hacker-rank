import java.math.BigDecimal;
import java.util.*;
import javafx.util.Pair;

class Solution {
    
    public static void main(String []argh) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        List<Pair<BigDecimal, String>> list = new ArrayList<Pair<BigDecimal, String>>();
        for (int i = 0; i < n; i++) {
            String s = sc.next();
            list.add(new Pair<BigDecimal,String>(new BigDecimal(s), s));
        }
        Collections.sort(list, (x, y) -> y.getKey().compareTo(x.getKey()));
        for(int i = 0; i < n; i++) {
            System.out.println(list.get(i).getValue());
        }
    }
}
