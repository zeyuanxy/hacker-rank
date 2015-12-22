/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-22 17:19:33
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-22 17:19:40
*/

class Add {
    void add(Integer... a) {
        int res = 0;
        for (int i = 0; i < a.length; ++i) {
            System.out.print(a[i]);
            System.out.print(i==a.length-1 ? "=" : "+");
            res += a[i];
        }
        System.out.println(res);
    }
}