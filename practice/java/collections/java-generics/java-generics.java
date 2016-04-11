/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-22 17:02:56
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-22 17:03:05
*/

class Printer {
    <T>
    void printArray(T[] a) {
        for (T e : a) {
            System.out.println(e);
        }
    }
}
