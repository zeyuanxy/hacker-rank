/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-23 20:57:34
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-23 20:57:41
*/

import static java.lang.System.in;

class Prime {
    boolean chk(int n){
        if(n<2)return false;
        for(int i=2;i*i<=n;i++)if(n%i==0)return false;
        return true;
    }
    void checkPrime(Integer... a){
        boolean f=false;
        for(int i=0;i<a.length;i++){
            if(chk(a[i])){
                if(f)java.lang.System.out.print(" ");
                f=true;
                java.lang.System.out.print(a[i]);
            }
        }
        java.lang.System.out.println();
    }
}